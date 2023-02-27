Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F228E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677536406; x=1709072406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TdbngbRU/Jq+rSXjZcX3GnsVTiFVMlEUNgt1vy0yoY=;
  b=oC6NBW9MePMTwG/0RbbeBHEDfCCzk+1Af+EGd1xTcIdeAHbXZz8i41Kl
   5ZTYZfPPxGbBto1dARzfKQeiiwNiFEuyUQZ4VcQ19b/VoKw57Pg4MjeV3
   USF6EyUtgJjp2ZqtvNo1UH6xbTpZMxiNnzKzOyrbIFUFDCzhCH7UUdWXR
   C/6mZ7hKfr/3pn4qQHDJiAwuJBSROvv1wj7VbDIAf1I+pbPsAz2a4lxAM
   9TYGl+g8EcT+EzmgtxJnkMoE1k2OChSqdl6ALl2oetehp77ug9zQCPvyS
   0DEvOziDqr86kjpOgM+YCT6ZOnZTokvZizVw4dNHgQM1M/H7qsnLW+cNO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420244691"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="420244691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 14:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706351565"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="706351565"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2023 14:20:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWlql-0004p5-0D;
	Mon, 27 Feb 2023 22:20:03 +0000
Date: Tue, 28 Feb 2023 06:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 151/583]
 drivers/mmc/host/bcm2835-sdhost.c:943:6: warning: no previous prototype for
 'bcm2835_sdhost_send_command'
Message-ID: <202302280659.NXtz17tR-lkp@intel.com>
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
commit: e734b9623f4b6941a8a22e267ca7edcc284684bb [151/583] Adding bcm2835-sdhost driver, and an overlay to enable it
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280659.NXtz17tR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/e734b9623f4b6941a8a22e267ca7edcc284684bb
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout e734b9623f4b6941a8a22e267ca7edcc284684bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/misc/ drivers/mmc/host/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280659.NXtz17tR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/bcm2835-sdhost.c:943:6: warning: no previous prototype for 'bcm2835_sdhost_send_command' [-Wmissing-prototypes]
     943 | bool bcm2835_sdhost_send_command(struct bcm2835_host *host,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/bcm2835-sdhost.c:1527:6: warning: no previous prototype for 'bcm2835_sdhost_set_clock' [-Wmissing-prototypes]
    1527 | void bcm2835_sdhost_set_clock(struct bcm2835_host *host, unsigned int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/bcm2835-sdhost.c:1891:5: warning: no previous prototype for 'bcm2835_sdhost_add_host' [-Wmissing-prototypes]
    1891 | int bcm2835_sdhost_add_host(struct bcm2835_host *host)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bcm2835_sdhost_send_command +943 drivers/mmc/host/bcm2835-sdhost.c

   942	
 > 943	bool bcm2835_sdhost_send_command(struct bcm2835_host *host,
   944					 struct mmc_command *cmd)
   945	{
   946		u32 sdcmd, sdhsts;
   947		unsigned long timeout;
   948		int delay;
   949	
   950		WARN_ON(host->cmd);
   951		log_event("CMD<", cmd->opcode, cmd->arg);
   952	
   953		if (cmd->data)
   954			pr_debug("%s: send_command %d 0x%x "
   955				 "(flags 0x%x) - %s %d*%d\n",
   956				 mmc_hostname(host->mmc),
   957				 cmd->opcode, cmd->arg, cmd->flags,
   958				 (cmd->data->flags & MMC_DATA_READ) ?
   959				 "read" : "write", cmd->data->blocks,
   960				 cmd->data->blksz);
   961		else
   962			pr_debug("%s: send_command %d 0x%x (flags 0x%x)\n",
   963				 mmc_hostname(host->mmc),
   964				 cmd->opcode, cmd->arg, cmd->flags);
   965	
   966		/* Wait max 100 ms */
   967		timeout = 10000;
   968	
   969		while (bcm2835_sdhost_read(host, SDCMD) & SDCMD_NEW_FLAG) {
   970			if (timeout == 0) {
   971				pr_warn("%s: previous command never completed.\n",
   972					mmc_hostname(host->mmc));
   973				if (host->debug)
   974					bcm2835_sdhost_dumpregs(host);
   975				cmd->error = -EILSEQ;
   976				tasklet_schedule(&host->finish_tasklet);
   977				return false;
   978			}
   979			timeout--;
   980			udelay(10);
   981		}
   982	
   983		delay = (10000 - timeout)/100;
   984		if (delay > host->max_delay) {
   985			host->max_delay = delay;
   986			pr_warn("%s: controller hung for %d ms\n",
   987				   mmc_hostname(host->mmc),
   988				   host->max_delay);
   989		}
   990	
   991		timeout = jiffies;
   992		if (!cmd->data && cmd->busy_timeout > 9000)
   993			timeout += DIV_ROUND_UP(cmd->busy_timeout, 1000) * HZ + HZ;
   994		else
   995			timeout += 10 * HZ;
   996		mod_timer(&host->timer, timeout);
   997	
   998		host->cmd = cmd;
   999	
  1000		/* Clear any error flags */
  1001		sdhsts = bcm2835_sdhost_read(host, SDHSTS);
  1002		if (sdhsts & SDHSTS_ERROR_MASK)
  1003			bcm2835_sdhost_write(host, sdhsts, SDHSTS);
  1004	
  1005		if ((cmd->flags & MMC_RSP_136) && (cmd->flags & MMC_RSP_BUSY)) {
  1006			pr_err("%s: unsupported response type!\n",
  1007				mmc_hostname(host->mmc));
  1008			cmd->error = -EINVAL;
  1009			tasklet_schedule(&host->finish_tasklet);
  1010			return false;
  1011		}
  1012	
  1013		bcm2835_sdhost_prepare_data(host, cmd);
  1014	
  1015		bcm2835_sdhost_write(host, cmd->arg, SDARG);
  1016	
  1017		sdcmd = cmd->opcode & SDCMD_CMD_MASK;
  1018	
  1019		host->use_busy = 0;
  1020		if (!(cmd->flags & MMC_RSP_PRESENT)) {
  1021			sdcmd |= SDCMD_NO_RESPONSE;
  1022		} else {
  1023			if (cmd->flags & MMC_RSP_136)
  1024				sdcmd |= SDCMD_LONG_RESPONSE;
  1025			if (cmd->flags & MMC_RSP_BUSY) {
  1026				sdcmd |= SDCMD_BUSYWAIT;
  1027				host->use_busy = 1;
  1028			}
  1029		}
  1030	
  1031		if (cmd->data) {
  1032			log_event("CMDD", cmd->data->blocks, cmd->data->blksz);
  1033			if (host->delay_after_this_stop) {
  1034				struct timespec64 now;
  1035				int time_since_stop;
  1036	
  1037				ktime_get_real_ts64(&now);
  1038				time_since_stop = now.tv_sec - host->stop_time.tv_sec;
  1039				if (time_since_stop < 2) {
  1040					/* Possibly less than one second */
  1041					time_since_stop = time_since_stop * 1000000 +
  1042						(now.tv_nsec - host->stop_time.tv_nsec)/1000;
  1043					if (time_since_stop <
  1044					    host->delay_after_this_stop)
  1045						udelay(host->delay_after_this_stop -
  1046						       time_since_stop);
  1047				}
  1048			}
  1049	
  1050			host->delay_after_this_stop = host->delay_after_stop;
  1051			if ((cmd->data->flags & MMC_DATA_READ) && !host->use_sbc) {
  1052				/* See if read crosses one of the hazardous sectors */
  1053				u32 first_blk, last_blk;
  1054	
  1055				/* Intentionally include the following sector because
  1056				   without CMD23/SBC the read may run on. */
  1057				first_blk = host->mrq->cmd->arg;
  1058				last_blk = first_blk + cmd->data->blocks;
  1059	
  1060				if (((last_blk >= (host->sectors - 64)) &&
  1061				     (first_blk <= (host->sectors - 64))) ||
  1062				    ((last_blk >= (host->sectors - 32)) &&
  1063				     (first_blk <= (host->sectors - 32)))) {
  1064					host->delay_after_this_stop =
  1065						max(250u, host->delay_after_stop);
  1066				}
  1067			}
  1068	
  1069			if (cmd->data->flags & MMC_DATA_WRITE)
  1070				sdcmd |= SDCMD_WRITE_CMD;
  1071			if (cmd->data->flags & MMC_DATA_READ)
  1072				sdcmd |= SDCMD_READ_CMD;
  1073		}
  1074	
  1075		bcm2835_sdhost_write(host, sdcmd | SDCMD_NEW_FLAG, SDCMD);
  1076	
  1077		return true;
  1078	}
  1079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
