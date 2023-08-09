Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6E1DA30
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691623612; x=1723159612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ixQVw7VGbo+vS/uXzu+r+IyIj9TmOFhvPcStBXBk8ks=;
  b=U/q77sHfEiMnuMbOB6PBIYOxLawKWBaL8Q14AbtvmN6/m5AcvMC60+wX
   /pxMHiODCqqJZL/6875k89kKGXD1Rq7avV4v412vZjFrpTfe7lsEVTYZf
   JJS4xmqln5xYMSU0pvBPDq8Cap2WElC68v4AwZyG0cO3QNqXzPSFF9vHC
   leP20Y+8LPJqlZjeewQ5+VJcmdky1B1ADZSb1Ms2rb/OQQ0Dj+T9pjy/G
   psyEcHHHJiFe5S79DMFm1y6u90NQfTFgbX2N0QPF/u4maK/3npHJy68jh
   8uyNw109r2wsbMu+i9zD7lfb51ZBs7hf7rGsQvu0CVy1nAl4WB63Aqf8J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370153952"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="370153952"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 16:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855717663"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="855717663"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Aug 2023 16:26:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTsZk-0006UO-26;
	Wed, 09 Aug 2023 23:26:48 +0000
Date: Thu, 10 Aug 2023 07:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] Bluetooth: hci_sync: Add hci_cmd_sync_queue_once
Message-ID: <202308100752.2ywy3qXp-lkp@intel.com>
References: <20230809213916.1636311-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809213916.1636311-1-luiz.dentz@gmail.com>

Hi Luiz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_sync-Add-hci_cmd_sync_queue_once/20230810-054032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230809213916.1636311-1-luiz.dentz%40gmail.com
patch subject: [RFC] Bluetooth: hci_sync: Add hci_cmd_sync_queue_once
config: arc-randconfig-r043-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100752.2ywy3qXp-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100752.2ywy3qXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100752.2ywy3qXp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/ktime.h:26,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/hci_sync.c:11:
>> net/bluetooth/hci_sync.c:770:15: error: 'hci_cmd_sync_pending' undeclared here (not in a function); did you mean 'hci_cmd_sync_init'?
     770 | EXPORT_SYMBOL(hci_cmd_sync_pending);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/bluetooth/hci_sync.c:770:1: note: in expansion of macro 'EXPORT_SYMBOL'
     770 | EXPORT_SYMBOL(hci_cmd_sync_pending);
         | ^~~~~~~~~~~~~


vim +770 net/bluetooth/hci_sync.c

   748	
   749	bool hci_cmd_sync_lookup(struct hci_dev *hdev, hci_cmd_sync_work_func_t func,
   750				 void *data, hci_cmd_sync_work_destroy_t destroy,
   751				 bool cancel)
   752	{
   753		struct hci_cmd_sync_work_entry *entry, *tmp;
   754	
   755		mutex_lock(&hdev->cmd_sync_work_lock);
   756		list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list) {
   757			if (entry->func == func && entry->data == data &&
   758			    entry->destroy == destroy) {
   759				if (cancel)
   760					_hci_cmd_sync_cancel_entry(hdev, entry,
   761								   -ECANCELED);
   762				mutex_unlock(&hdev->cmd_sync_work_lock);
   763				return true;
   764			}
   765		}
   766		mutex_unlock(&hdev->cmd_sync_work_lock);
   767	
   768		return false;
   769	}
 > 770	EXPORT_SYMBOL(hci_cmd_sync_pending);
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
