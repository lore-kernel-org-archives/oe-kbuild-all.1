Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300C79EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677528900; x=1709064900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IffN6d4gT93p52KVt5tqKpFmnyKRXXNZKQ7sEcI8rkM=;
  b=UBPmU48eMKakc7x6AUfVnF8yjnduR4QnfSIdz8qhXVUgd7bmo6TSQofR
   fa71Go6YH0pvcbPn8e9Hmb9C5MtyZSF02bvdHWAGNfVW3NkOU5ja/D6Ad
   7116MU/e1fijjMEl1rTDhR2yU5E8tb4fhouZXcMvvCXgvw95NCLe8o5hh
   6lnKOvRVLAbVuUIyg8WExN4JdmSWZAimMYcR5nAxh+MnxL420j2hm6xiO
   ujEYZKDyE01qd/Uve23fDDOdQdvORjmNsysebc+6CyulH/tJtFMjYk8EF
   EwtE4ARP5vAnGgdsaiO+XUr/wnhr4r4v7kjyLY8SOZ1USPsWvo+D+9y+o
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335444971"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="335444971"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 12:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704150943"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="704150943"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 12:14:58 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWjti-0004kR-01;
	Mon, 27 Feb 2023 20:14:58 +0000
Date: Tue, 28 Feb 2023 04:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 150/583]
 drivers/mmc/host/bcm2835-mmc.c:655:6: warning: no previous prototype for
 'bcm2835_mmc_send_command'
Message-ID: <202302280433.ONqxq1QK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: c582cc62f89bd7b27095a0b0f7b83aedb3d4aab5 [150/583] MMC: added alternative MMC driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280433.ONqxq1QK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/c582cc62f89bd7b27095a0b0f7b83aedb3d4aab5
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout c582cc62f89bd7b27095a0b0f7b83aedb3d4aab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/misc/ drivers/mmc/host/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280433.ONqxq1QK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/bcm2835-mmc.c:655:6: warning: no previous prototype for 'bcm2835_mmc_send_command' [-Wmissing-prototypes]
     655 | void bcm2835_mmc_send_command(struct bcm2835_host *host, struct mmc_command *cmd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/bcm2835-mmc.c:1063:6: warning: no previous prototype for 'bcm2835_mmc_set_clock' [-Wmissing-prototypes]
    1063 | void bcm2835_mmc_set_clock(struct bcm2835_host *host, unsigned int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/bcm2835_mmc_send_command +655 drivers/mmc/host/bcm2835-mmc.c

   654	
 > 655	void bcm2835_mmc_send_command(struct bcm2835_host *host, struct mmc_command *cmd)
   656	{
   657		int flags;
   658		u32 mask;
   659		unsigned long timeout;
   660	
   661		WARN_ON(host->cmd);
   662	
   663		/* Wait max 10 ms */
   664		timeout = 1000;
   665	
   666		mask = SDHCI_CMD_INHIBIT;
   667		if ((cmd->data != NULL) || (cmd->flags & MMC_RSP_BUSY))
   668			mask |= SDHCI_DATA_INHIBIT;
   669	
   670		/* We shouldn't wait for data inihibit for stop commands, even
   671		   though they might use busy signaling */
   672		if (host->mrq->data && (cmd == host->mrq->data->stop))
   673			mask &= ~SDHCI_DATA_INHIBIT;
   674	
   675		while (bcm2835_mmc_readl(host, SDHCI_PRESENT_STATE) & mask) {
   676			if (timeout == 0) {
   677				pr_err("%s: Controller never released inhibit bit(s).\n",
   678					mmc_hostname(host->mmc));
   679				bcm2835_mmc_dumpregs(host);
   680				cmd->error = -EIO;
   681				tasklet_schedule(&host->finish_tasklet);
   682				return;
   683			}
   684			timeout--;
   685			udelay(10);
   686		}
   687	
   688		if ((1000-timeout)/100 > 1 && (1000-timeout)/100 > host->max_delay) {
   689			host->max_delay = (1000-timeout)/100;
   690			pr_warn("Warning: MMC controller hung for %d ms\n", host->max_delay);
   691		}
   692	
   693		timeout = jiffies;
   694		if (!cmd->data && cmd->busy_timeout > 9000)
   695			timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
   696		else
   697			timeout += 10 * HZ;
   698		mod_timer(&host->timer, timeout);
   699	
   700		host->cmd = cmd;
   701		host->use_dma = false;
   702	
   703		bcm2835_mmc_prepare_data(host, cmd);
   704	
   705		bcm2835_mmc_writel(host, cmd->arg, SDHCI_ARGUMENT, 6);
   706	
   707		bcm2835_mmc_set_transfer_mode(host, cmd);
   708	
   709		if ((cmd->flags & MMC_RSP_136) && (cmd->flags & MMC_RSP_BUSY)) {
   710			pr_err("%s: Unsupported response type!\n",
   711				mmc_hostname(host->mmc));
   712			cmd->error = -EINVAL;
   713			tasklet_schedule(&host->finish_tasklet);
   714			return;
   715		}
   716	
   717		if (!(cmd->flags & MMC_RSP_PRESENT))
   718			flags = SDHCI_CMD_RESP_NONE;
   719		else if (cmd->flags & MMC_RSP_136)
   720			flags = SDHCI_CMD_RESP_LONG;
   721		else if (cmd->flags & MMC_RSP_BUSY)
   722			flags = SDHCI_CMD_RESP_SHORT_BUSY;
   723		else
   724			flags = SDHCI_CMD_RESP_SHORT;
   725	
   726		if (cmd->flags & MMC_RSP_CRC)
   727			flags |= SDHCI_CMD_CRC;
   728		if (cmd->flags & MMC_RSP_OPCODE)
   729			flags |= SDHCI_CMD_INDEX;
   730	
   731		if (cmd->data)
   732			flags |= SDHCI_CMD_DATA;
   733	
   734		bcm2835_mmc_writew(host, SDHCI_MAKE_CMD(cmd->opcode, flags), SDHCI_COMMAND);
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
