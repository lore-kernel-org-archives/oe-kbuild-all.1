Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3B28F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678962304; x=1710498304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vOeMo0XFKfqKWdYGjD9rANGbrJFxVjhdVEjJG6ytNag=;
  b=I6D2osJ5Xsu515I8gKfELzPmwvBTE/cLhtwYv9chJm4P6zB7Ipy2nzeI
   FJff2rbq06fscMP6lFUjgkfuHrbjGb5LyQ0RHdxxn9fYL6AiqQKt5v8nU
   o/Mbvswrrtx7kA6wxQJEh9k8u/BJT37wz5F3oWpZLeIIrUyoGtcNurcMc
   FdbcH9T/WvSdKouF2zcLql5qsp8Ob0093B9HOC1AdAFSGPKCzlOaQinLM
   DvnkrT/j7jypl0IzaQVK1Qj+Qsi6Zp0yNpdzPbCzo1KoFN0fTr8kQixok
   PN5yLkgwW/BvK7sy+jvQFMXX9AuhJiJeP7818T8K1tlFDlIjVtQipmPsv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="326301445"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="326301445"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 03:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790223570"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="790223570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 03:24:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pckmZ-0008TC-27;
	Thu, 16 Mar 2023 10:24:27 +0000
Date: Thu, 16 Mar 2023 18:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: hildawu@realtek.com, marcel@holtmann.org
Cc: oe-kbuild-all@lists.linux.dev, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	apusaka@chromium.org, mmandlik@google.com, yinghsu@chromium.org,
	max.chou@realtek.com, alex_lu@realsil.com.cn, kidman@realtek.com
Subject: Re: [PATCH] Bluetooth: msft: Extended monitor tracking by address
 filter
Message-ID: <202303161807.AcfCGsAP-lkp@intel.com>
References: <20230316090729.14572-1-hildawu@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316090729.14572-1-hildawu@realtek.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hildawu-realtek-com/Bluetooth-msft-Extended-monitor-tracking-by-address-filter/20230316-170950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20230316090729.14572-1-hildawu%40realtek.com
patch subject: [PATCH] Bluetooth: msft: Extended monitor tracking by address filter
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303161807.AcfCGsAP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cee47af4605a9e5cba61be1ab1d92e8748d92e1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review hildawu-realtek-com/Bluetooth-msft-Extended-monitor-tracking-by-address-filter/20230316-170950
        git checkout cee47af4605a9e5cba61be1ab1d92e8748d92e1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161807.AcfCGsAP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bluetooth/msft.c: In function 'msft_add_monitor_sync':
>> net/bluetooth/msft.c:521:50: warning: variable 'rp' set but not used [-Wunused-but-set-variable]
     521 |         struct msft_rp_le_monitor_advertisement *rp;
         |                                                  ^~


vim +/rp +521 net/bluetooth/msft.c

   507	
   508	static int msft_add_monitor_sync(struct hci_dev *hdev,
   509					 struct adv_monitor *monitor)
   510	{
   511		struct msft_cp_le_monitor_advertisement *cp;
   512		struct msft_le_monitor_advertisement_pattern_data *pattern_data;
   513		struct msft_le_monitor_advertisement_pattern *pattern;
   514		struct adv_pattern *entry;
   515		size_t total_size = sizeof(*cp) + sizeof(*pattern_data);
   516		ptrdiff_t offset = 0;
   517		u8 pattern_count = 0;
   518		struct sk_buff *skb;
   519		int err;
   520		struct msft_monitor_advertisement_handle_data *handle_data;
 > 521		struct msft_rp_le_monitor_advertisement *rp;
   522	
   523		if (!msft_monitor_pattern_valid(monitor))
   524			return -EINVAL;
   525	
   526		list_for_each_entry(entry, &monitor->patterns, list) {
   527			pattern_count++;
   528			total_size += sizeof(*pattern) + entry->length;
   529		}
   530	
   531		cp = kmalloc(total_size, GFP_KERNEL);
   532		if (!cp)
   533			return -ENOMEM;
   534	
   535		cp->sub_opcode = MSFT_OP_LE_MONITOR_ADVERTISEMENT;
   536		cp->rssi_high = monitor->rssi.high_threshold;
   537		cp->rssi_low = monitor->rssi.low_threshold;
   538		cp->rssi_low_interval = (u8)monitor->rssi.low_threshold_timeout;
   539		cp->rssi_sampling_period = monitor->rssi.sampling_period;
   540	
   541		cp->cond_type = MSFT_MONITOR_ADVERTISEMENT_TYPE_PATTERN;
   542	
   543		pattern_data = (void *)cp->data;
   544		pattern_data->count = pattern_count;
   545	
   546		list_for_each_entry(entry, &monitor->patterns, list) {
   547			pattern = (void *)(pattern_data->data + offset);
   548			/* the length also includes data_type and offset */
   549			pattern->length = entry->length + 2;
   550			pattern->data_type = entry->ad_type;
   551			pattern->start_byte = entry->offset;
   552			memcpy(pattern->pattern, entry->value, entry->length);
   553			offset += sizeof(*pattern) + entry->length;
   554		}
   555	
   556		skb = __hci_cmd_sync(hdev, hdev->msft_opcode, total_size, cp,
   557				     HCI_CMD_TIMEOUT);
   558	
   559		if (IS_ERR_OR_NULL(skb)) {
   560			kfree(cp);
   561			return PTR_ERR(skb);
   562		}
   563	
   564		err = msft_le_monitor_advertisement_cb(hdev, hdev->msft_opcode,
   565						       monitor, skb);
   566		if (!err) {
   567			rp = (struct msft_rp_le_monitor_advertisement *)skb->data;
   568			handle_data = msft_find_handle_data(hdev, monitor->handle,
   569							    true);
   570			if (handle_data) {
   571				handle_data->rssi_high   = cp->rssi_high;
   572				handle_data->rssi_low    = cp->rssi_low;
   573				handle_data->rssi_low_interval    =
   574							cp->rssi_low_interval;
   575				handle_data->rssi_sampling_period =
   576							cp->rssi_sampling_period;
   577			}
   578		}
   579		kfree(cp);
   580	
   581		return err;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
