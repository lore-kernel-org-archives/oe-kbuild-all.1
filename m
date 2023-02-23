Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63469AD26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677189386; x=1708725386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hxGn09qEKW0bfSSMkJ67BCjmZCNNL19VfUC4DGHn0E=;
  b=ejxKPSjrPSK4NLz1ay3GK5CTM0H1vak++HtNatdC0kPkXBRRV9I4aixm
   z6cVA9ghEnuQdKuO9VFqr4bHZlNzcDCuJXWVSPAcNhvttl4GkaycsC1vC
   bXEo086zaqG9WM0vp/lbdY5ei1WqdL1YXxF3TIPyETemJMd2MYvcDzwbD
   jPlw6cPh+zJRLeV7W3njnDyBHDfjTjwemVgCBBPVOPnlJEyB+0xUt6XDS
   Ep8Ap+ayG+5nqzzFBKpmzCbCVMxiZ8RsJ2z9m9YRh9KbNxBQ961twMHjd
   Pe35lMUdO7ETDsyMrB/vbhqiFZJYk1cnzkCodEGgQZZaXS+JwnBq8lfzG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317088363"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="317088363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815511334"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="815511334"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 13:56:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVJZe-0001ov-0g;
	Thu, 23 Feb 2023 21:56:22 +0000
Date: Fri, 24 Feb 2023 05:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Mueller <dmueller@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [stable:linux-4.14.y 3749/9999]
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c:392:25: warning:
 'cmd.data1' is used uninitialized in this function
Message-ID: <202302240558.t9rDU7X9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   1e61bd26fa2cf667b8ffada212c8965efbd924ea
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3749/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: arc-randconfig-c032-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240558.t9rDU7X9-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout 88f7a6aa7fb9aa5076b65489146045dac865f1d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/ethernet/myricom/myri10ge/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240558.t9rDU7X9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/myricom/myri10ge/myri10ge.c: In function 'myri10ge_allocate_rings':
>> drivers/net/ethernet/myricom/myri10ge/myri10ge.c:392:25: warning: 'cmd.data1' is used uninitialized in this function [-Wuninitialized]
     buf->data1 = htonl(data->data1);
                            ^~
>> drivers/net/ethernet/myricom/myri10ge/myri10ge.c:393:25: warning: 'cmd.data2' is used uninitialized in this function [-Wuninitialized]
     buf->data2 = htonl(data->data2);
                            ^~


vim +392 drivers/net/ethernet/myricom/myri10ge/myri10ge.c

7d3510356b066b drivers/net/myri10ge/myri10ge.c Rusty Russell 2010-08-11  376  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  377  static int
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  378  myri10ge_send_cmd(struct myri10ge_priv *mgp, u32 cmd,
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  379  		  struct myri10ge_cmd *data, int atomic)
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  380  {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  381  	struct mcp_cmd *buf;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  382  	char buf_bytes[sizeof(*buf) + 8];
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  383  	struct mcp_cmd_response *response = mgp->cmd;
e700f9f4a208bf drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-08-14  384  	char __iomem *cmd_addr = mgp->sram + MXGEFW_ETH_CMD;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  385  	u32 dma_low, dma_high, result, value;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  386  	int sleep_total = 0;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  387  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  388  	/* ensure buf is aligned to 8 bytes */
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  389  	buf = (struct mcp_cmd *)ALIGN((unsigned long)buf_bytes, 8);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  390  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  391  	buf->data0 = htonl(data->data0);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23 @392  	buf->data1 = htonl(data->data1);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23 @393  	buf->data2 = htonl(data->data2);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  394  	buf->cmd = htonl(cmd);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  395  	dma_low = MYRI10GE_LOWPART_TO_U32(mgp->cmd_bus);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  396  	dma_high = MYRI10GE_HIGHPART_TO_U32(mgp->cmd_bus);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  397  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  398  	buf->response_addr.low = htonl(dma_low);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  399  	buf->response_addr.high = htonl(dma_high);
40f6cff5c47efa drivers/net/myri10ge/myri10ge.c Al Viro       2006-11-20  400  	response->result = htonl(MYRI10GE_NO_RESPONSE_RESULT);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  401  	mb();
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  402  	myri10ge_pio_copy(cmd_addr, buf, sizeof(*buf));
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  403  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  404  	/* wait up to 15ms. Longest command is the DMA benchmark,
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  405  	 * which is capped at 5ms, but runs from a timeout handler
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  406  	 * that runs every 7.8ms. So a 15ms timeout leaves us with
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  407  	 * a 2.2ms margin
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  408  	 */
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  409  	if (atomic) {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  410  		/* if atomic is set, do not sleep,
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  411  		 * and try to get the completion quickly
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  412  		 * (1ms will be enough for those commands) */
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  413  		for (sleep_total = 0;
8e95a2026f3b43 drivers/net/myri10ge/myri10ge.c Joe Perches   2009-12-03  414  		     sleep_total < 1000 &&
8e95a2026f3b43 drivers/net/myri10ge/myri10ge.c Joe Perches   2009-12-03  415  		     response->result == htonl(MYRI10GE_NO_RESPONSE_RESULT);
bd2db0cf2411eb drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-05-09  416  		     sleep_total += 10) {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  417  			udelay(10);
bd2db0cf2411eb drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-05-09  418  			mb();
bd2db0cf2411eb drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-05-09  419  		}
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  420  	} else {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  421  		/* use msleep for most command */
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  422  		for (sleep_total = 0;
8e95a2026f3b43 drivers/net/myri10ge/myri10ge.c Joe Perches   2009-12-03  423  		     sleep_total < 15 &&
8e95a2026f3b43 drivers/net/myri10ge/myri10ge.c Joe Perches   2009-12-03  424  		     response->result == htonl(MYRI10GE_NO_RESPONSE_RESULT);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  425  		     sleep_total++)
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  426  			msleep(1);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  427  	}
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  428  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  429  	result = ntohl(response->result);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  430  	value = ntohl(response->data);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  431  	if (result != MYRI10GE_NO_RESPONSE_RESULT) {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  432  		if (result == 0) {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  433  			data->data0 = value;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  434  			return 0;
85a7ea1b0a3263 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-08-21  435  		} else if (result == MXGEFW_CMD_UNKNOWN) {
85a7ea1b0a3263 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-08-21  436  			return -ENOSYS;
5443e9ead4f53f drivers/net/myri10ge/myri10ge.c Brice Goglin  2007-05-07  437  		} else if (result == MXGEFW_CMD_ERROR_UNALIGNED) {
5443e9ead4f53f drivers/net/myri10ge/myri10ge.c Brice Goglin  2007-05-07  438  			return -E2BIG;
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  439  		} else if (result == MXGEFW_CMD_ERROR_RANGE &&
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  440  			   cmd == MXGEFW_CMD_ENABLE_RSS_QUEUES &&
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  441  			   (data->
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  442  			    data1 & MXGEFW_SLICE_ENABLE_MULTIPLE_TX_QUEUES) !=
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  443  			   0) {
236bb5e649c2a7 drivers/net/myri10ge/myri10ge.c Brice Goglin  2008-09-28  444  			return -ERANGE;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  445  		} else {
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  446  			dev_err(&mgp->pdev->dev,
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  447  				"command %d failed, result = %d\n",
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  448  				cmd, result);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  449  			return -ENXIO;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  450  		}
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  451  	}
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  452  
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  453  	dev_err(&mgp->pdev->dev, "command %d timed out, result = %d\n",
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  454  		cmd, result);
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  455  	return -EAGAIN;
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  456  }
0da34b6dfe5581 drivers/net/myri10ge/myri10ge.c Brice Goglin  2006-05-23  457  

:::::: The code at line 392 was first introduced by commit
:::::: 0da34b6dfe55810ae60db57e08e2af8a808c0a55 [PATCH] Add Myri-10G Ethernet driver

:::::: TO: Brice Goglin <brice@myri.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
