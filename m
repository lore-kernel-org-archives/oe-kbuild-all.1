Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20C361
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 04:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686718676; x=1718254676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZzYK1qJbvS5rbTkIPTvyqdeqBd9oIHgEv+TMqS6toKk=;
  b=ELz1cuB0QQWIdc6nGnw42TubqI6+aHfbYBNPkIyTpQuiTEeGWlJ4pLAZ
   mcWnERX2me2nF///FHtu9Trh/ZEs+m+rKDKz9/vDt8dD0mbQOnO8PahEf
   82MGuF7gOEJIQV7Fr2uPIcLsi5dFoC9jj6TkeYjv8SJF1Epw1aG8dIW+X
   k7HXnwpHJXvpXj8a9vZVKRHTbiLVTuLXGO2rYnXT0sN5UP8NzS1drelQ2
   gp9gZ3uWsJ9yb8398Pt9e0eb/QIPboPbywMCvaZF9HPPgt+kO0juBs1ue
   Xf1LCUAtNC8KvDu1yT9EeKV7KhVHjy9houCIgfEp6HE5GsjiWKEqTQ6cL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338153728"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="338153728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 21:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="706071738"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="706071738"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 21:57:50 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9IZp-0000CP-1u;
	Wed, 14 Jun 2023 04:57:49 +0000
Date: Wed, 14 Jun 2023 12:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: mwilck@suse.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev,
	James Bottomley <jejb@linux.vnet.ibm.com>,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>, Martin Wilck <mwilck@suse.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>
Subject: Re: [PATCH v6 6/7] scsi: replace scsi_target_block() by
 scsi_block_targets()
Message-ID: <202306141255.47GfqLNb-lkp@intel.com>
References: <20230613174227.11235-7-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613174227.11235-7-mwilck@suse.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next axboe-block/for-next linus/master v6.4-rc6 next-20230613]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mwilck-suse-com/bsg-increase-number-of-devices/20230614-014437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230613174227.11235-7-mwilck%40suse.com
patch subject: [PATCH v6 6/7] scsi: replace scsi_target_block() by scsi_block_targets()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306141255.47GfqLNb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
        git fetch mkp-scsi for-next
        git checkout mkp-scsi/for-next
        b4 shazam https://lore.kernel.org/r/20230613174227.11235-7-mwilck@suse.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/scsi/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141255.47GfqLNb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/scsi_lib.c:2912:1: error: conflicting types for 'scsi_block_targets'; have 'void(struct device *, struct Scsi_Host *)'
    2912 | scsi_block_targets(struct device *dev, struct Scsi_Host *shost)
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/scsi/scsi_cmnd.h:12,
                    from drivers/scsi/scsi_lib.c:29:
   include/scsi/scsi_device.h:459:6: note: previous declaration of 'scsi_block_targets' with type 'void(struct Scsi_Host *, struct device *)'
     459 | void scsi_block_targets(struct Scsi_Host *shost, struct device *dev);
         |      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/scsi/scsi_lib.c:12:
   drivers/scsi/scsi_lib.c:2918:19: error: conflicting types for 'scsi_block_targets'; have 'void(struct device *, struct Scsi_Host *)'
    2918 | EXPORT_SYMBOL_GPL(scsi_block_targets);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:2918:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2918 | EXPORT_SYMBOL_GPL(scsi_block_targets);
         | ^~~~~~~~~~~~~~~~~
   include/scsi/scsi_device.h:459:6: note: previous declaration of 'scsi_block_targets' with type 'void(struct Scsi_Host *, struct device *)'
     459 | void scsi_block_targets(struct Scsi_Host *shost, struct device *dev);
         |      ^~~~~~~~~~~~~~~~~~


vim +2912 drivers/scsi/scsi_lib.c

  2898	
  2899	/**
  2900	 * scsi_block_targets - transition all SCSI child devices to SDEV_BLOCK state
  2901	 * @dev: a parent device of one or more scsi_target devices
  2902	 * @shost: the Scsi_Host to which this device belongs
  2903	 *
  2904	 * Iterate over all children of @dev, which should be scsi_target devices,
  2905	 * and switch all subordinate scsi devices to SDEV_BLOCK state. Wait for
  2906	 * ongoing scsi_queue_rq() calls to finish. May sleep.
  2907	 *
  2908	 * Note:
  2909	 * @dev must not itself be a scsi_target device.
  2910	 */
  2911	void
> 2912	scsi_block_targets(struct device *dev, struct Scsi_Host *shost)
  2913	{
  2914		WARN_ON_ONCE(scsi_is_target_device(dev));
  2915		device_for_each_child(dev, NULL, target_block);
  2916		blk_mq_wait_quiesce_done(&shost->tag_set);
  2917	}
  2918	EXPORT_SYMBOL_GPL(scsi_block_targets);
  2919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
