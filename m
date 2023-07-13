Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000317AB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689258055; x=1720794055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZomfgIAu+4Cyfi4DgYx1okeUBHZwKLI68SwGz/y1Hg=;
  b=FK87pGmA5Wf1GXI1IWAaYWLuRGRYKUh/dJiQNUiecutn9St73iuDVGFi
   zVg+IFEtdGTBs/3PKx/oYozM916qjx/WAvXX2BUR4KCG3VA/MRgYIwehZ
   u/q0WrTqVMQkO4OKnEApcuzVGVUg+dO9vGKC8DpwOh/MeyAIGOToXUbSO
   Spxw1oYA1LHR88j8xJAfbbltubDCSKhz1IzWeGMfl4dobC50C2H6o2hRR
   8dfjRXOxvrdj+Mqrp2M61fPMmRyxDReZgwfQoWV4/zC1FHLq8/lzqPgCi
   a+mU8PnHyytNrzVWTR24RgNVgTZQ3wC1qDAemLVOK+/HtPkz+6ZnasAol
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368744825"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="368744825"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 06:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699262010"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="699262010"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 06:46:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJwej-0006dx-2b;
	Thu, 13 Jul 2023 13:46:53 +0000
Date: Thu, 13 Jul 2023 21:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-mmc:next 3/11] drivers/mmc/host/mmci.c:811:17: error: implicit
 declaration of function 'dev_sbg'; did you mean 'dev_dbg'?
Message-ID: <202307132143.zFvbDAGK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   9f8a7787f3f98b77d0844a83a6df6fe383d88ca2
commit: 1b12ce08ebdfd50e7b593b370c087ded61a9fae0 [3/11] mmc: mmci: Improve ux500 debug prints
config: arm64-randconfig-r024-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132143.zFvbDAGK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132143.zFvbDAGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132143.zFvbDAGK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/mmci.c: In function 'ux500_busy_complete':
>> drivers/mmc/host/mmci.c:811:17: error: implicit declaration of function 'dev_sbg'; did you mean 'dev_dbg'? [-Werror=implicit-function-declaration]
     811 |                 dev_sbg(mmc_dev(host->mmc), "fell through on state %d, CMD%02x\n",
         |                 ^~~~~~~
         |                 dev_dbg
   cc1: some warnings being treated as errors


vim +811 drivers/mmc/host/mmci.c

   698	
   699	/*
   700	 * ux500_busy_complete() - this will wait until the busy status
   701	 * goes off, saving any status that occur in the meantime into
   702	 * host->busy_status until we know the card is not busy any more.
   703	 * The function returns true when the busy detection is ended
   704	 * and we should continue processing the command.
   705	 *
   706	 * The Ux500 typically fires two IRQs over a busy cycle like this:
   707	 *
   708	 *  DAT0 busy          +-----------------+
   709	 *                     |                 |
   710	 *  DAT0 not busy  ----+                 +--------
   711	 *
   712	 *                     ^                 ^
   713	 *                     |                 |
   714	 *                    IRQ1              IRQ2
   715	 */
   716	static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
   717					u32 status, u32 err_msk)
   718	{
   719		void __iomem *base = host->base;
   720		int retries = 10;
   721	
   722		if (status & err_msk) {
   723			/* Stop any ongoing busy detection if an error occurs */
   724			ux500_busy_clear_mask_done(host);
   725			goto out_ret_state;
   726		}
   727	
   728		/*
   729		 * The state transitions are encoded in a state machine crossing
   730		 * the edges in this switch statement.
   731		 */
   732		switch (host->busy_state) {
   733	
   734		/*
   735		 * Before unmasking for the busy end IRQ, confirm that the
   736		 * command was sent successfully. To keep track of having a
   737		 * command in-progress, waiting for busy signaling to end,
   738		 * store the status in host->busy_status.
   739		 *
   740		 * Note that, the card may need a couple of clock cycles before
   741		 * it starts signaling busy on DAT0, hence re-read the
   742		 * MMCISTATUS register here, to allow the busy bit to be set.
   743		 */
   744		case MMCI_BUSY_DONE:
   745			/*
   746			 * Save the first status register read to be sure to catch
   747			 * all bits that may be lost will retrying. If the command
   748			 * is still busy this will result in assigning 0 to
   749			 * host->busy_status, which is what it should be in IDLE.
   750			 */
   751			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
   752			while (retries) {
   753				status = readl(base + MMCISTATUS);
   754				/* Keep accumulating status bits */
   755				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
   756				if (status & host->variant->busy_detect_flag) {
   757					writel(readl(base + MMCIMASK0) |
   758					       host->variant->busy_detect_mask,
   759					       base + MMCIMASK0);
   760					host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
   761					schedule_delayed_work(&host->ux500_busy_timeout_work,
   762					      msecs_to_jiffies(cmd->busy_timeout));
   763					goto out_ret_state;
   764				}
   765				retries--;
   766			}
   767			dev_dbg(mmc_dev(host->mmc),
   768				"no busy signalling in time CMD%02x\n", cmd->opcode);
   769			ux500_busy_clear_mask_done(host);
   770			break;
   771	
   772		/*
   773		 * If there is a command in-progress that has been successfully
   774		 * sent, then bail out if busy status is set and wait for the
   775		 * busy end IRQ.
   776		 *
   777		 * Note that, the HW triggers an IRQ on both edges while
   778		 * monitoring DAT0 for busy completion, but there is only one
   779		 * status bit in MMCISTATUS for the busy state. Therefore
   780		 * both the start and the end interrupts needs to be cleared,
   781		 * one after the other. So, clear the busy start IRQ here.
   782		 */
   783		case MMCI_BUSY_WAITING_FOR_START_IRQ:
   784			if (status & host->variant->busy_detect_flag) {
   785				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
   786				writel(host->variant->busy_detect_mask, base + MMCICLEAR);
   787				host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
   788			} else {
   789				dev_dbg(mmc_dev(host->mmc),
   790					"lost busy status when waiting for busy start IRQ CMD%02x\n",
   791					cmd->opcode);
   792				cancel_delayed_work(&host->ux500_busy_timeout_work);
   793				ux500_busy_clear_mask_done(host);
   794			}
   795			break;
   796	
   797		case MMCI_BUSY_WAITING_FOR_END_IRQ:
   798			if (!(status & host->variant->busy_detect_flag)) {
   799				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
   800				writel(host->variant->busy_detect_mask, base + MMCICLEAR);
   801				cancel_delayed_work(&host->ux500_busy_timeout_work);
   802				ux500_busy_clear_mask_done(host);
   803			} else {
   804				dev_dbg(mmc_dev(host->mmc),
   805					"busy status still asserted when handling busy end IRQ - will keep waiting CMD%02x\n",
   806					cmd->opcode);
   807			}
   808			break;
   809	
   810		default:
 > 811			dev_sbg(mmc_dev(host->mmc), "fell through on state %d, CMD%02x\n",
   812				host->busy_state, cmd->opcode);
   813			break;
   814		}
   815	
   816	out_ret_state:
   817		return (host->busy_state == MMCI_BUSY_DONE);
   818	}
   819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
