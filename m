Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C018C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKW0hLGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698682340; x=1730218340;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jYXNOlPF/X2NhBp56tPeUHccKUziT9nm1U6+A6duR3E=;
  b=HKW0hLGWrN5xfaI3weuvViIew0zQuLOQ8QeOylahGLFYDQWUIKJzd7Ez
   uXXClCCT2GVkS7+5U1cIpkQHvmH+qGTayg2C6VQ51UKDWU1+Cp9NV0feE
   /C5adZvi9hAm6ZgCUbqLdwTk2oikNbiI6FduwEyxgPBTC7hJ/d6VPDoHb
   sugee/FZk9ToudXfocnAZO4IuU0LmWQ8bP3ETiWwqPb93N9DEnIbEgSp5
   ZRyLW4z6tgLlUaj1KF+4HjdGdHVtGUH5c8CqiNn1BIKzcXZFxRJkuJLTI
   cg8boAnxi2KVn/62CK/Sk2BDO0rtz5G9kcOLLIkZCtD+i+A5nS3h3hQKS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368313722"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="368313722"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 09:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1007465610"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1007465610"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2023 09:11:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxUri-000DOB-0g;
	Mon, 30 Oct 2023 16:11:46 +0000
Date: Tue, 31 Oct 2023 00:11:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 13853/16121]
 drivers/usb/typec/altmodes/displayport.c:309:33: error: too few arguments to
 function 'drm_connector_oob_hotplug_event'
Message-ID: <202310310033.bHg1vZQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: 7cd62eab9babd1fed9c497141650b31168f4f430 [13853/16121] BackMerge tag 'v6.6-rc7' into drm-next
config: x86_64-randconfig-001-20231030 (https://download.01.org/0day-ci/archive/20231031/202310310033.bHg1vZQx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310033.bHg1vZQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310033.bHg1vZQx-lkp@intel.com/

Note: the linux-next/master HEAD c503e3eec382ac708ee7adf874add37b77c5d312 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/usb/typec/altmodes/displayport.c: In function 'dp_altmode_vdm':
>> drivers/usb/typec/altmodes/displayport.c:309:33: error: too few arguments to function 'drm_connector_oob_hotplug_event'
     309 |                                 drm_connector_oob_hotplug_event(dp->connector_fwnode);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/typec/altmodes/displayport.c:17:
   include/drm/drm_connector.h:1984:6: note: declared here
    1984 | void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_connector_oob_hotplug_event +309 drivers/usb/typec/altmodes/displayport.c

0e3bb7d6894d9b Heikki Krogerus 2018-06-27  281  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  282  static int dp_altmode_vdm(struct typec_altmode *alt,
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  283  			  const u32 hdr, const u32 *vdo, int count)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  284  {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  285  	struct dp_altmode *dp = typec_altmode_get_drvdata(alt);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  286  	int cmd_type = PD_VDO_CMDT(hdr);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  287  	int cmd = PD_VDO_CMD(hdr);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  288  	int ret = 0;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  289  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  290  	mutex_lock(&dp->lock);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  291  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  292  	if (dp->state != DP_STATE_IDLE) {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  293  		ret = -EBUSY;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  294  		goto err_unlock;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  295  	}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  296  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  297  	switch (cmd_type) {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  298  	case CMDT_RSP_ACK:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  299  		switch (cmd) {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  300  		case CMD_ENTER_MODE:
25d6d1bfc213bc Prashant Malani 2023-01-20  301  			typec_altmode_update_active(alt, true);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  302  			dp->state = DP_STATE_UPDATE;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  303  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  304  		case CMD_EXIT_MODE:
25d6d1bfc213bc Prashant Malani 2023-01-20  305  			typec_altmode_update_active(alt, false);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  306  			dp->data.status = 0;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  307  			dp->data.conf = 0;
89434b069e4609 RD Babiera      2023-10-09  308  			if (dp->hpd) {
89434b069e4609 RD Babiera      2023-10-09 @309  				drm_connector_oob_hotplug_event(dp->connector_fwnode);
89434b069e4609 RD Babiera      2023-10-09  310  				dp->hpd = false;
89434b069e4609 RD Babiera      2023-10-09  311  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
89434b069e4609 RD Babiera      2023-10-09  312  			}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  313  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  314  		case DP_CMD_STATUS_UPDATE:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  315  			dp->data.status = *vdo;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  316  			ret = dp_altmode_status_update(dp);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  317  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  318  		case DP_CMD_CONFIGURE:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  319  			ret = dp_altmode_configured(dp);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  320  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  321  		default:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  322  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  323  		}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  324  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  325  	case CMDT_RSP_NAK:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  326  		switch (cmd) {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  327  		case DP_CMD_CONFIGURE:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  328  			dp->data.conf = 0;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  329  			ret = dp_altmode_configured(dp);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  330  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  331  		default:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  332  			break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  333  		}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  334  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  335  	default:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  336  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  337  	}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  338  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  339  	if (dp->state != DP_STATE_IDLE)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  340  		schedule_work(&dp->work);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  341  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  342  err_unlock:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  343  	mutex_unlock(&dp->lock);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  344  	return ret;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  345  }
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  346  

:::::: The code at line 309 was first introduced by commit
:::::: 89434b069e460967624903b049e5cf5c9e6b99b9 usb: typec: altmodes/displayport: Signal hpd low when exiting mode

:::::: TO: RD Babiera <rdbabiera@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
