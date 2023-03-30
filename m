Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0241C31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680168108; x=1711704108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6mGTlpU1IVuvQh1ixKK/vHqK4uu3Vh62qa1dPLBFytg=;
  b=JUcaX7S6q0fTUgbTfrBqiSpNmt0PV8KKuRzrHmTXZXEoUaKOoyUmgVH4
   iyodNK4Io6Ygqf6vAyfDKfJYUlNXR+CNF/jILf1gI2PmUZhhQoNIQPKL2
   sFx6v4HBCa6o0hBsTswD6bBlb4o2H1FJBwpUIGMBBVMlbJSi9ZolRRNF1
   CJooiNdCnFK1TurBwVJ3xSTBAZvzyka/k4wKBXxr8jP2ULPw38Vs7OuKf
   Zk6mOGf7MGvNru1c+D/PQclUDYrH514AOQjU8Gbh07oPzA0DO3w0dvBxk
   iSLPTb3aDWQ8nzYHtF6C7cJ4CFh5wHTDeZaHZWyybNpQI+F2EPp2jirOd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343569208"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343569208"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 02:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753926770"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753926770"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 02:21:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phoTY-000KgO-15;
	Thu, 30 Mar 2023 09:21:44 +0000
Date: Thu, 30 Mar 2023 17:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Mandlik <mmandlik@google.com>, marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	chromeos-bluetooth-upstreaming@chromium.org,
	linux-bluetooth@vger.kernel.org,
	Manish Mandlik <mmandlik@google.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] Bluetooth: Add vhci devcoredump support
Message-ID: <202303301732.rPkAOhqw-lkp@intel.com>
References: <20230329230447.v12.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329230447.v12.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc@changeid>

Hi Manish,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manish-Mandlik/Bluetooth-Add-vhci-devcoredump-support/20230330-140719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20230329230447.v12.2.Ief9a81a3643d2291f6db2b3695c3a6e0159467dc%40changeid
patch subject: [PATCH v12 2/4] Bluetooth: Add vhci devcoredump support
config: csky-randconfig-r034-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301732.rPkAOhqw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a96b21e272af3d91f47b77b297f1289c867259b4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Manish-Mandlik/Bluetooth-Add-vhci-devcoredump-support/20230330-140719
        git checkout a96b21e272af3d91f47b77b297f1289c867259b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301732.rPkAOhqw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/hci_vhci.c: In function 'force_devcd_write':
>> drivers/bluetooth/hci_vhci.c:334:21: error: 'struct hci_dev' has no member named 'dump'
     334 |                 hdev->dump.timeout = msecs_to_jiffies(dump_data.timeout * 1000);
         |                     ^~


vim +334 drivers/bluetooth/hci_vhci.c

   310	
   311	static ssize_t force_devcd_write(struct file *file, const char __user *user_buf,
   312					 size_t count, loff_t *ppos)
   313	{
   314		struct vhci_data *data = file->private_data;
   315		struct hci_dev *hdev = data->hdev;
   316		struct sk_buff *skb = NULL;
   317		struct devcoredump_test_data dump_data;
   318		int ret;
   319	
   320		ret = simple_write_to_buffer(&dump_data, sizeof(dump_data), ppos,
   321					     user_buf, count);
   322		if (ret < count)
   323			return ret;
   324	
   325		skb = alloc_skb(sizeof(dump_data.data), GFP_ATOMIC);
   326		if (!skb)
   327			return -ENOMEM;
   328		skb_put_data(skb, &dump_data.data, sizeof(dump_data.data));
   329	
   330		hci_devcd_register(hdev, vhci_coredump, vhci_coredump_hdr, NULL);
   331	
   332		/* Force the devcoredump timeout */
   333		if (dump_data.timeout)
 > 334			hdev->dump.timeout = msecs_to_jiffies(dump_data.timeout * 1000);
   335	
   336		ret = hci_devcd_init(hdev, skb->len);
   337		if (ret) {
   338			BT_ERR("Failed to generate devcoredump");
   339			kfree_skb(skb);
   340			return ret;
   341		}
   342	
   343		hci_devcd_append(hdev, skb);
   344	
   345		switch (dump_data.state) {
   346		case HCI_DEVCOREDUMP_DONE:
   347			hci_devcd_complete(hdev);
   348			break;
   349		case HCI_DEVCOREDUMP_ABORT:
   350			hci_devcd_abort(hdev);
   351			break;
   352		case HCI_DEVCOREDUMP_TIMEOUT:
   353			/* Do nothing */
   354			break;
   355		default:
   356			return -EINVAL;
   357		}
   358	
   359		return count;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
