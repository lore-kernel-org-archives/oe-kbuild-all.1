Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B4136E01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 20:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726260686; cv=none; b=UqlpnwW5obyESITNDLXZyAQuGHEXSCovl25nScGmV4dSY1wzftoRu4SJovH91Bq79p/v7mMtYU52gdaf4F2Ybf6PguhXYGAUHPJqCrrJqeAfPx10T4qMXvhGKJCubhx7ZzS/E3PCKpkqoVFFLBlIfXZI84D2kaPPowtTf5Gps8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726260686; c=relaxed/simple;
	bh=xpOnorOAPD5K01VhK6afzVYl02JALBAdPXmtI4vebZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVFrMO8fg7KhI7/FrSq+J7WjVRhDAFplWxSU/Ia26ZqzrlQ91l9NoFpszoNxxm+oJTdqpZ2GFpwAfMpqUEWXldJ+FEaDLWHBavn69Gp4i3yh9T8dNyCR3lJFLxBg77yn3KoXC5peMOoD0utARqBJP8I9K9HstCtaNOxuNFz5Pk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Otyd5NWC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Otyd5NWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726260685; x=1757796685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpOnorOAPD5K01VhK6afzVYl02JALBAdPXmtI4vebZ8=;
  b=Otyd5NWCGAcN4qHni8/gXZoxRPHS4/Ve+1keoeGttlyGGyDgRkG5TBLL
   xXyT9DMI/89P2W59IZIpH0p+rjtCiwGPzB7W1XgF2uIjbRarsCS6scFd9
   2mjOoeyolz2MYpTm9nXAteqfoFxzxeo8V1bgJWRm3Tu8h38C2N9eI6zWF
   g0WZ/9yvwG5FtNFvmxLXm8iyMuS/KqdDS5mkYziq6OLeMNWHHSU9wvJHS
   DW7TwdlGZhz8cBgv4K/r5nLvjZAUDLVebfrU8i2+HhQdsN5K9lEBlGmE5
   pZUBzmCV9nljIjnnqBSVaNF8mvzACMynJE9yRzDTVeD6OQdtEkYB5/8CZ
   A==;
X-CSE-ConnectionGUID: eqd7AcZ+Ssa1wIcJid4L+Q==
X-CSE-MsgGUID: 4HTsWr2GTbCl32uotTkBhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25112373"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25112373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:51:23 -0700
X-CSE-ConnectionGUID: xSDwJ3aiRp6TgDmOBK7APQ==
X-CSE-MsgGUID: q/p1p85ZSdW7AcnyXT5+UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72785713"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 13:51:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spDGC-00070D-0j;
	Fri, 13 Sep 2024 20:51:20 +0000
Date: Sat, 14 Sep 2024 04:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next v2 3/4] serial: 8250: Switch to nbcon console
Message-ID: <202409140437.EP0Ryw3u-lkp@intel.com>
References: <20240913140538.221708-4-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913140538.221708-4-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b794563ea12fb46d9499da9e30c33d9607e33697]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/serial-8250-Split-out-IER-from-rs485_start_tx/20240913-220810
base:   b794563ea12fb46d9499da9e30c33d9607e33697
patch link:    https://lore.kernel.org/r/20240913140538.221708-4-john.ogness%40linutronix.de
patch subject: [PATCH next v2 3/4] serial: 8250: Switch to nbcon console
config: arc-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140437.EP0Ryw3u-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140437.EP0Ryw3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140437.EP0Ryw3u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:1904:13: warning: 'modem_status_handler' defined but not used [-Wunused-function]
    1904 | static void modem_status_handler(struct irq_work *iwp)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/modem_status_handler +1904 drivers/tty/serial/8250/8250_port.c

  1898	
  1899	/*
  1900	 * irq_work handler to perform modem control. Only triggered via
  1901	 * write_atomic() callback because it may be in a scheduler or NMI
  1902	 * context, unable to wake tasks.
  1903	 */
> 1904	static void modem_status_handler(struct irq_work *iwp)
  1905	{
  1906		struct uart_8250_port *up = container_of(iwp, struct uart_8250_port, modem_status_work);
  1907		struct uart_port *port = &up->port;
  1908	
  1909		uart_port_lock(port);
  1910		serial8250_modem_status(up);
  1911		uart_port_unlock(port);
  1912	}
  1913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
