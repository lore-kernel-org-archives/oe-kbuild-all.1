Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C834168BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 21:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDBw8tfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698269858; x=1729805858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLkZ/spXLDE/X3SPb4yUzV7BXdPK+4XWDQeqGiQSXsY=;
  b=nDBw8tfcoVmFp3kdDGUEqzD7mEb0oHxZ0/GTTgwzzzoPT9wOOD0QHb0t
   pGe0DaU3k8YNh4YbWzgNGlkLrT4EzKGrclCE7bcP+Y2nuO68/K2e29Lrf
   oJAitym6ic2DQ3lSsOofnTM5TRC9QPgJ0yQj4fI5xfStkEXGOdCXVnbWv
   980wStkEwNnB6KwrbEZg0daBDFCyw5BIWdSD2kFAJ+ljJDfMtQbmvYACe
   048rRS65DiCrZNsjFKCmgStKAJiYOqU4PxUrA9QAlexn02CjsXJmEWF9G
   CucDrhGCTWqc0prJ83lC6xPY07vtzRxNN9hMQwYfXsHRmY97JAGzrdiO9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="205287"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="205287"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="788257727"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="788257727"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2023 14:37:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvlZG-0009DW-17;
	Wed, 25 Oct 2023 21:37:34 +0000
Date: Thu, 26 Oct 2023 05:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 19/35]
 drivers/media/cec/core/cec-adap.c:389:17: sparse: sparse: incompatible types
 in conditional expression (different base types):
Message-ID: <202310260558.W7Gc8XtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   b2d0b6b6ced1309d1daa4df79ec6a36f126a903f
commit: cb6f9185b7c8a86fd3e09d5f829bc3a73e02029b [19/35] media: cec: core: add adap_nb_transmit_canceled() callback
config: i386-randconfig-061-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260558.W7Gc8XtE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260558.W7Gc8XtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260558.W7Gc8XtE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
 > 389			call_op(adap, adap_nb_transmit_canceled, &data->msg);
   390	
   391		cec_data_completed(data);
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
