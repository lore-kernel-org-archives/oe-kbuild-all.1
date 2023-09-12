Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB020E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694494402; x=1726030402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C6OH0tfkcRK7Wgvxx/JTwOoztK3sfx2XJLqVCFlj3VY=;
  b=c9HZ0Z6tt06SBYx7lxC/2BI2q5yxHKZPFxpIZe4fmA68VbObdKgPEKvz
   ka9r5MNXgwheI9Zrz222HtLoW476b/PvukHUsGvXnIFi+dPOGCtUUUaJB
   S0Ko6V2Eb7DywS05XbKraDzXA5YfVCH9Tn40NeUhPe3/Zj/iIB8SfqKpw
   77cB8W3GYkAZtTBFa40q6vuZypux7qg71wiIAW7nPwPE4bMfVfQOOxpjD
   eCW/HesCv4POvcRJCHHogwEWcgEyH4GkuXhxcW7D7ZUJyElwlSfH6BBP6
   Qa0r9Ow3eAH1Nc3zKfPOaP0KgKNQT/Jy00KCaY94kNqyYpo4S7h0Mfc/a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375604472"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="375604472"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 21:53:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="693353709"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="693353709"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Sep 2023 21:53:20 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfvOn-0007LN-35;
	Tue, 12 Sep 2023 04:53:17 +0000
Date: Tue, 12 Sep 2023 12:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/4] vduse: Add function to get/free the pages for
 reconnection
Message-ID: <202309121218.RnlHiKrN-lkp@intel.com>
References: <20230912030008.3599514-2-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912030008.3599514-2-lulu@redhat.com>

Hi Cindy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on horms-ipvs/master]
[cannot apply to linus/master v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vduse-Add-function-to-get-free-the-pages-for-reconnection/20230912-110327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git master
patch link:    https://lore.kernel.org/r/20230912030008.3599514-2-lulu%40redhat.com
patch subject: [RFC v2 1/4] vduse: Add function to get/free the pages for reconnection
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309121218.RnlHiKrN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121218.RnlHiKrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121218.RnlHiKrN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vdpa/vdpa_user/vduse_dev.c:1055:5: warning: no previous prototype for 'vduse_alloc_reconnnect_info_mem' [-Wmissing-prototypes]
    1055 | int vduse_alloc_reconnnect_info_mem(struct vduse_dev *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vdpa/vdpa_user/vduse_dev.c:1092:5: warning: no previous prototype for 'vduse_free_reconnnect_info_mem' [-Wmissing-prototypes]
    1092 | int vduse_free_reconnnect_info_mem(struct vduse_dev *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vduse_alloc_reconnnect_info_mem +1055 drivers/vdpa/vdpa_user/vduse_dev.c

  1054	
> 1055	int vduse_alloc_reconnnect_info_mem(struct vduse_dev *dev)
  1056	{
  1057		struct vdpa_reconnect_info *info;
  1058		struct vduse_virtqueue *vq;
  1059		void *addr;
  1060	
  1061		/*page 0 is use to save status,dpdk will use this to save the information
  1062		 *needed in reconnection,kernel don't need to maintain this
  1063		 */
  1064		info = &dev->reconnect_status;
  1065		addr = (void *)get_zeroed_page(GFP_KERNEL);
  1066		if (!addr)
  1067			return -1;
  1068	
  1069		info->addr = virt_to_phys(addr);
  1070		info->vaddr = (unsigned long)(addr);
  1071		info->size = PAGE_SIZE;
  1072		/* index is vm Offset in PAGE_SIZE */
  1073		info->index = 0;
  1074	
  1075		/*page 1~ vq_num + 1 save the reconnect info for vqs*/
  1076		for (int i = 0; i < dev->vq_num + 1; i++) {
  1077			vq = &dev->vqs[i];
  1078			info = &vq->reconnect_info;
  1079			addr = (void *)get_zeroed_page(GFP_KERNEL);
  1080			if (!addr)
  1081				return -1;
  1082	
  1083			info->addr = virt_to_phys(addr);
  1084			info->vaddr = (unsigned long)(addr);
  1085			info->size = PAGE_SIZE;
  1086			info->index = i + 1;
  1087		}
  1088	
  1089		return 0;
  1090	}
  1091	
> 1092	int vduse_free_reconnnect_info_mem(struct vduse_dev *dev)
  1093	{
  1094		struct vdpa_reconnect_info *info;
  1095		struct vduse_virtqueue *vq;
  1096	
  1097		info = &dev->reconnect_status;
  1098		free_page(info->vaddr);
  1099		info->size = 0;
  1100		info->addr = 0;
  1101		info->vaddr = 0;
  1102		for (int i = 0; i < dev->vq_num + 1; i++) {
  1103			vq = &dev->vqs[i];
  1104			info = &vq->reconnect_info;
  1105			free_page(info->vaddr);
  1106			info->size = 0;
  1107			info->addr = 0;
  1108			info->vaddr = 0;
  1109		}
  1110	
  1111		return 0;
  1112	}
  1113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
