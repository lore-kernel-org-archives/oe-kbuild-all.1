Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08836FA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680118156; x=1711654156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xeDmjrHHnABVteH5Ec6CypoFDMg3Kan9s3iitS46crs=;
  b=mrU5cschwt4A4YicTq/YtviYwmXlvxQLgzzN8YQpy64dtA/XfZi5BQV7
   1YCos8wEW1lP6bwgxQ4Swyu0OyrxUSaEqXvSHOe1n/8//yISXfv1GXJdn
   UQXYp7tRxvL8Zihig7pIzawQVYK6LiYBLI4HOv6uKaYduXoqBAsoPH8Fi
   qsL94asvJQAg/XTOkEIWwUCusQ1ScU5lO5LH0xO97L+ISscUMtx15HIxs
   qzqNLTSlsx/EYefOhKDln+cRZvuGobusrXMSZR4F8J/sCk/kfn+cfvSe4
   EEPVPgZeUqzunBWsrVQty8yP6aeCpfMn8R1Sm5cG2JzMrxkpyU7BO0c9H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329466248"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329466248"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808348318"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808348318"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 12:29:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbTp-000JsM-2F;
	Wed, 29 Mar 2023 19:29:09 +0000
Date: Thu, 30 Mar 2023 03:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v8 18/20]
 drivers/nvme/target/tcp.c:653:29: error: 'struct nvmet_tcp_queue' has no
 member named 'tls_psk'
Message-ID: <202303300320.DQz90XwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v8
head:   b160cccb84362674ac09fb349ab21bd2339eb28e
commit: 6f832c87e83768f104444dbfc3945a8ee2e24b65 [18/20] nvmet-tcp: rework sendpage for kTLS
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230330/202303300320.DQz90XwQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=6f832c87e83768f104444dbfc3945a8ee2e24b65
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v8
        git checkout 6f832c87e83768f104444dbfc3945a8ee2e24b65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/nvme/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300320.DQz90XwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/target/tcp.c: In function 'nvmet_try_send_response':
>> drivers/nvme/target/tcp.c:653:29: error: 'struct nvmet_tcp_queue' has no member named 'tls_psk'
     653 |         else if (!cmd->queue->tls_psk)
         |                             ^~
   drivers/nvme/target/tcp.c: In function 'nvmet_try_send_r2t':
   drivers/nvme/target/tcp.c:681:29: error: 'struct nvmet_tcp_queue' has no member named 'tls_psk'
     681 |         else if (!cmd->queue->tls_psk)
         |                             ^~
   drivers/nvme/target/tcp.c: In function 'nvmet_try_send_ddgst':
   drivers/nvme/target/tcp.c:711:29: error: 'struct nvmet_tcp_queue' has no member named 'tls_psk'
     711 |         else if (!cmd->queue->tls_psk)
         |                             ^~
   drivers/nvme/target/tcp.c: In function 'nvmet_tcp_alloc_queue':
   drivers/nvme/target/tcp.c:1801:1: warning: label 'out_free_queue' defined but not used [-Wunused-label]
    1801 | out_free_queue:
         | ^~~~~~~~~~~~~~


vim +653 drivers/nvme/target/tcp.c

   642	
   643	static int nvmet_try_send_response(struct nvmet_tcp_cmd *cmd,
   644			bool last_in_batch)
   645	{
   646		u8 hdgst = nvmet_tcp_hdgst_len(cmd->queue);
   647		int left = sizeof(*cmd->rsp_pdu) - cmd->offset + hdgst;
   648		int flags = MSG_DONTWAIT;
   649		int ret;
   650	
   651		if (!last_in_batch && cmd->queue->send_list_len)
   652			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
 > 653		else if (!cmd->queue->tls_psk)
   654			flags |= MSG_EOR;
   655	
   656		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
   657			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
   658		if (ret <= 0)
   659			return ret;
   660		cmd->offset += ret;
   661		left -= ret;
   662	
   663		if (left)
   664			return -EAGAIN;
   665	
   666		nvmet_tcp_free_cmd_buffers(cmd);
   667		cmd->queue->snd_cmd = NULL;
   668		nvmet_tcp_put_cmd(cmd);
   669		return 1;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
