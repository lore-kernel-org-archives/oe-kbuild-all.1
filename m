Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522073C34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681909194; x=1713445194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQxUBJkh52ZIcBz2avvF9V8D1m1UMFj4FbHga+METpE=;
  b=LyTjjQMQnl+lnNqiYuI3zbuWRnVal26r3t77SmtnHY4AvlPSMhtaEfPh
   swhI3tsU91GmEEemT+9XroBpA1XbAnfW4LCfkdN4iAYc+cYz7k9FWVgbV
   5hHZc7Q6lFxmt+Pg9nCR8/d21Pwo/UCg016Z14kiWNmFhHgtpAzVETfnd
   EIpzbt02wvYCjDZhqaAg5qe1jFAUKYR8cQUj+7CzcUAZaVMC1M0bPsZMH
   uRxpOvfQ5wNJQ2qK+8l9Zip6v4mdGUC7AwiD4RJr3XTx8ZsbJpJBZPm0Y
   bPWa8ytNq62Bxv2yi4frZz5U5CgilBvsSaqdx9utqgiPpBqiiLgQ542kr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334247591"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="334247591"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 05:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724036057"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="724036057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 05:59:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp7Pa-000etT-2Y;
	Wed, 19 Apr 2023 12:59:50 +0000
Date: Wed, 19 Apr 2023 20:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lew <quic_clew@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Deepak Kumar Singh <quic_deesin@quicinc.com>,
	Sarannya S <quic_sarannya@quicinc.com>
Subject: [remoteproc:rpmsg-next 5/10]
 drivers/rpmsg/qcom_glink_native.c:1064:26: error: 'struct rpmsg_endpoint'
 has no member named 'flow_cb'
Message-ID: <202304192022.hiRhfRNj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   cc888eb072b6a48642e429a030b065d4da1d594b
commit: 96a7a78517751f01c2a3aeef46768159aca370fd [5/10] rpmsg: glink: Add support to handle signals command
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304192022.hiRhfRNj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?id=96a7a78517751f01c2a3aeef46768159aca370fd
        git remote add remoteproc git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
        git fetch --no-tags remoteproc rpmsg-next
        git checkout 96a7a78517751f01c2a3aeef46768159aca370fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304192022.hiRhfRNj-lkp@intel.com/

Note: the remoteproc/rpmsg-next HEAD cc888eb072b6a48642e429a030b065d4da1d594b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/rpmsg/qcom_glink_native.c: In function 'qcom_glink_handle_signals':
>> drivers/rpmsg/qcom_glink_native.c:1064:26: error: 'struct rpmsg_endpoint' has no member named 'flow_cb'
    1064 |         if (!channel->ept.flow_cb)
         |                          ^
   drivers/rpmsg/qcom_glink_native.c:1070:21: error: 'struct rpmsg_endpoint' has no member named 'flow_cb'
    1070 |         channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
         |                     ^


vim +1064 drivers/rpmsg/qcom_glink_native.c

  1048	
  1049	static int qcom_glink_handle_signals(struct qcom_glink *glink,
  1050					     unsigned int rcid, unsigned int sigs)
  1051	{
  1052		struct glink_channel *channel;
  1053		unsigned long flags;
  1054		bool enable = false;
  1055	
  1056		spin_lock_irqsave(&glink->idr_lock, flags);
  1057		channel = idr_find(&glink->rcids, rcid);
  1058		spin_unlock_irqrestore(&glink->idr_lock, flags);
  1059		if (!channel) {
  1060			dev_err(glink->dev, "signal for non-existing channel\n");
  1061			return -EINVAL;
  1062		}
  1063	
> 1064		if (!channel->ept.flow_cb)
  1065			return 0;
  1066	
  1067		if (sigs & (NATIVE_DSR_SIG | NATIVE_CTS_SIG))
  1068			enable = true;
  1069	
  1070		channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
  1071	
  1072		return 0;
  1073	}
  1074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
