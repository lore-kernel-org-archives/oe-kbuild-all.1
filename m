Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE0627
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b49UrlqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698800686; x=1730336686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmVtTe8yZZhwGEv3fwHYpE27eB8B9HkShe2k3vvydso=;
  b=b49UrlqTzyM3hmafxnIyrE3sj1cXGpVA8Rwz2j0U4fj+cwg+MKBp2odA
   0oYIZvm93P6PkDAjZNymQexwjecoEDWyBmX37ZlR1EU28eF8NN2zDX5fC
   J1pGYlTr2Uansq8dmk9t+a8qJda53qAkIR/Z5LVixtsYw0FKLDCAWZwH5
   zWpEVJGv5u4Zo8zxSwehpA0cyknHZDBSQwfLkx9IYxPiYQBiMhx0aEyVI
   ODal14QjnAObfq4SYCEYcezuI1HhGkQcF+EzWBVE+pu3cDqqq20N1zDvi
   6u+QQV5IapgrJUTnsV4KuhZE53DOln2kmiuPa/KQVHXn9lCp8vaZ/ZcJe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368614297"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="368614297"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 18:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760790591"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="760790591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Oct 2023 18:03:54 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxzeB-0000Uy-2R;
	Wed, 01 Nov 2023 01:03:51 +0000
Date: Wed, 1 Nov 2023 09:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Wahl <rwahl@gmx.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ronald Wahl <ronald.wahl@raritan.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] serial: 8250: 8250_omap: Do not start RX DMA on THRI
 interrupt
Message-ID: <202311010816.kXNniDbT-lkp@intel.com>
References: <20231031110950.11714-1-rwahl@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031110950.11714-1-rwahl@gmx.de>

Hi Ronald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronald-Wahl/serial-8250-8250_omap-Do-not-start-RX-DMA-on-THRI-interrupt/20231031-191258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231031110950.11714-1-rwahl%40gmx.de
patch subject: [PATCH v3] serial: 8250: 8250_omap: Do not start RX DMA on THRI interrupt
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311010816.kXNniDbT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010816.kXNniDbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010816.kXNniDbT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_omap.c: In function 'omap_8250_dma_handle_irq':
>> drivers/tty/serial/8250/8250_omap.c:1301:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    1301 |         if ((iir & 0x3f) != UART_IIR_THRI)
         |            ^


vim +/else +1301 drivers/tty/serial/8250/8250_omap.c

  1279	
  1280	/*
  1281	 * This is mostly serial8250_handle_irq(). We have a slightly different DMA
  1282	 * hoook for RX/TX and need different logic for them in the ISR. Therefore we
  1283	 * use the default routine in the non-DMA case and this one for with DMA.
  1284	 */
  1285	static int omap_8250_dma_handle_irq(struct uart_port *port)
  1286	{
  1287		struct uart_8250_port *up = up_to_u8250p(port);
  1288		struct omap8250_priv *priv = up->port.private_data;
  1289		u16 status;
  1290		u8 iir;
  1291	
  1292		iir = serial_port_in(port, UART_IIR);
  1293		if (iir & UART_IIR_NO_INT) {
  1294			return IRQ_HANDLED;
  1295		}
  1296	
  1297		uart_port_lock(port);
  1298	
  1299		status = serial_port_in(port, UART_LSR);
  1300	
> 1301		if ((iir & 0x3f) != UART_IIR_THRI)
  1302			if (priv->habit & UART_HAS_EFR2)
  1303				am654_8250_handle_rx_dma(up, iir, status);
  1304			else
  1305				status = omap_8250_handle_rx_dma(up, iir, status);
  1306	
  1307		serial8250_modem_status(up);
  1308		if (status & UART_LSR_THRE && up->dma->tx_err) {
  1309			if (uart_tx_stopped(&up->port) ||
  1310			    uart_circ_empty(&up->port.state->xmit)) {
  1311				up->dma->tx_err = 0;
  1312				serial8250_tx_chars(up);
  1313			} else  {
  1314				/*
  1315				 * try again due to an earlier failer which
  1316				 * might have been resolved by now.
  1317				 */
  1318				if (omap_8250_tx_dma(up))
  1319					serial8250_tx_chars(up);
  1320			}
  1321		}
  1322	
  1323		uart_unlock_and_check_sysrq(port);
  1324	
  1325		return 1;
  1326	}
  1327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
