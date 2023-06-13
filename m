Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF917C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686622231; x=1718158231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQnUXA6uRhWyaCf1XLja3o9/8hDBJ6orXDsnqU0+Yq8=;
  b=Uzlp8iEzcYpYGQUTLvcI9xU39uxPxaWhbliFeY1OvMw0W0YLkC4zIM4l
   cGIFe/iod6ODmugno8ET07KI8aX8NHSpQfBM1cc9FyCQyIGGsbMCNKOxK
   JXXKgxllbsxRQVjZdw6YLCdhzPW3SgFcr0gVXQP4kV4kOqCnW8vDaGAhM
   j0NDcSDaYg3lh8zr31LhA0GSJCUJkUbHlQcZe/KLWqqw+vMKbRn0z7qkh
   9UuLbJPQSqHwPgKS0wqN2SsbtB2iDD9/8jrAoqdljAAiCKlGSqJmCR6om
   YSQPorH0djH2UsTOI+gXSNaO/viKurxdJRgDnGeuf0RCTaJXTb9dSgtsy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361577346"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="361577346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835703856"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="835703856"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2023 19:10:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8tUH-0000vN-2O;
	Tue, 13 Jun 2023 02:10:25 +0000
Date: Tue, 13 Jun 2023 10:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:staging 1/3]
 drivers/media/cec/core/cec-adap.c:389:17: sparse: sparse: incompatible types
 in conditional expression (different base types):
Message-ID: <202306131057.2gnoG6VC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git staging
head:   32c8db22932c23fa3e43fca02ae0d8cfa92c2f35
commit: b835badd915436d1d43910d16c1807587117ad0c [1/3] [PATCH] media: cec: core: add adap_transmit_canceled() callback
config: riscv-randconfig-s031-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131057.2gnoG6VC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree staging
        git checkout b835badd915436d1d43910d16c1807587117ad0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/cec/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131057.2gnoG6VC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> drivers/media/cec/core/cec-adap.c:389:17: sparse: sparse: incompatible types in conditional expression (different base types):
>> drivers/media/cec/core/cec-adap.c:389:17: sparse:    void
>> drivers/media/cec/core/cec-adap.c:389:17: sparse:    int

vim +389 drivers/media/cec/core/cec-adap.c

   344	
   345	/*
   346	 * A pending CEC transmit needs to be cancelled, either because the CEC
   347	 * adapter is disabled or the transmit takes an impossibly long time to
   348	 * finish, or the reply timed out.
   349	 *
   350	 * This function is called with adap->lock held.
   351	 */
   352	static void cec_data_cancel(struct cec_data *data, u8 tx_status, u8 rx_status)
   353	{
   354		struct cec_adapter *adap = data->adap;
   355	
   356		/*
   357		 * It's either the current transmit, or it is a pending
   358		 * transmit. Take the appropriate action to clear it.
   359		 */
   360		if (adap->transmitting == data) {
   361			adap->transmitting = NULL;
   362		} else {
   363			list_del_init(&data->list);
   364			if (!(data->msg.tx_status & CEC_TX_STATUS_OK))
   365				if (!WARN_ON(!adap->transmit_queue_sz))
   366					adap->transmit_queue_sz--;
   367		}
   368	
   369		if (data->msg.tx_status & CEC_TX_STATUS_OK) {
   370			data->msg.rx_ts = ktime_get_ns();
   371			data->msg.rx_status = rx_status;
   372			if (!data->blocking)
   373				data->msg.tx_status = 0;
   374		} else {
   375			data->msg.tx_ts = ktime_get_ns();
   376			data->msg.tx_status |= tx_status |
   377					       CEC_TX_STATUS_MAX_RETRIES;
   378			data->msg.tx_error_cnt++;
   379			data->attempts = 0;
   380			if (!data->blocking)
   381				data->msg.rx_status = 0;
   382		}
   383	
   384		/* Queue transmitted message for monitoring purposes */
   385		cec_queue_msg_monitor(adap, &data->msg, 1);
   386	
   387		if (!data->blocking && data->msg.sequence)
   388			/* Allow drivers to react to a canceled transmit */
 > 389			call_op(adap, adap_transmit_canceled, &data->msg);
   390	
   391		cec_data_completed(data);
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
