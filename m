Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF9EACC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695840738; x=1727376738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmS4Xa9XAGTCoRhLdbsc0By6bpPy/vQ0LcDcAwDTVw0=;
  b=fY2dPT3TfDRQv5iZJHPvH88vDOgE26mJrHwcCTSLdursGAIPFsZ68gHp
   7Q9TLrr7hjzWz1JdQcJmnP/OXJ05QnSxxE+5Wgs48F3IxDhtEZB4qOHGi
   /VZWx4KLd2hPgVDXPTqcySZkDeEbx9ufIXax4/6ercG5gUpM5/HQ7KTu4
   BUVhGtDdemvxvZKMyuHZMngI1qFMNZCN3MCIqLwSfCVDjk3Y4aAGe8sV/
   gYRNK56qEfXEY0duGzoYUnX7bHkhy2Zr9A3nVENJWUKZom6xAW+ZFxXXU
   xYa7wymjAIMe0XEChmKG+N2qwjHS6VUP3GDdQF5bye0k8PbYt3mcJh3tO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3441283"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="3441283"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 11:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996279425"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="996279425"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 11:52:15 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlZds-0000Y8-1B;
	Wed, 27 Sep 2023 18:52:12 +0000
Date: Thu, 28 Sep 2023 02:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.6-rc1 6/137]
 drivers/of/overlay.c:76: warning: Function parameter or member 'ovcs' not
 described in 'fragment'
Message-ID: <202309280221.McwYanU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.6-rc1
head:   5b25c3b1c2d80478ded680c33b1067e3faed4c0d
commit: ccc4bf85f5a94ae31785151f50a3637e4cfe8808 [6/137] of: overlay: Add per overlay sysfs attributes
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309280221.McwYanU6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280221.McwYanU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280221.McwYanU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/overlay.c:76: warning: Function parameter or member 'ovcs' not described in 'fragment'
>> drivers/of/overlay.c:76: warning: Function parameter or member 'attr_group' not described in 'fragment'
>> drivers/of/overlay.c:76: warning: Function parameter or member 'attrs' not described in 'fragment'
>> drivers/of/overlay.c:76: warning: Function parameter or member 'target_attr' not described in 'fragment'
>> drivers/of/overlay.c:104: warning: Function parameter or member 'attr_groups' not described in 'overlay_changeset'
   drivers/of/overlay.c:104: warning: Function parameter or member 'kobj' not described in 'overlay_changeset'


vim +76 drivers/of/overlay.c

6b4955ba7bc05e Frank Rowand      2018-10-04   61  
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   62  /**
0290c4ca2536a3 Frank Rowand      2017-10-17   63   * struct fragment - info about fragment nodes in overlay expanded device tree
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   64   * @info:	info node that contains the target and overlay
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   65   * @target:	target of the overlay operation
0290c4ca2536a3 Frank Rowand      2017-10-17   66   * @overlay:	pointer to the __overlay__ node
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   67   */
0290c4ca2536a3 Frank Rowand      2017-10-17   68  struct fragment {
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   69  	struct device_node *overlay;
81225ea682f456 Frank Rowand      2018-10-04   70  	struct device_node *target;
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   71  	struct overlay_changeset *ovcs;
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   72  	struct device_node *info;
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   73  	struct attribute_group attr_group;
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   74  	struct attribute *attrs[2];
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23   75  	struct fragment_attribute target_attr;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  @76  };
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   77  
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   78  /**
0290c4ca2536a3 Frank Rowand      2017-10-17   79   * struct overlay_changeset
39a751a4cb7e47 Frank Rowand      2018-02-12   80   * @id:			changeset identifier
0290c4ca2536a3 Frank Rowand      2017-10-17   81   * @ovcs_list:		list on which we are located
1e4089667c7c73 Frank Rowand      2022-04-20   82   * @new_fdt:		Memory allocated to hold unflattened aligned FDT
067c098766c6af Frank Rowand      2022-04-20   83   * @overlay_mem:	the memory chunk that contains @overlay_root
1e4089667c7c73 Frank Rowand      2022-04-20   84   * @overlay_root:	expanded device tree that contains the fragment nodes
067c098766c6af Frank Rowand      2022-04-20   85   * @notify_state:	most recent notify action used on overlay
3912b7917ab78d Frank Rowand      2017-10-17   86   * @count:		count of fragment structures
3912b7917ab78d Frank Rowand      2017-10-17   87   * @fragments:		fragment nodes in the overlay expanded device tree
3912b7917ab78d Frank Rowand      2017-10-17   88   * @symbols_fragment:	last element of @fragments[] is the  __symbols__ node
0290c4ca2536a3 Frank Rowand      2017-10-17   89   * @cset:		changeset to apply fragments to live device tree
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   90   */
0290c4ca2536a3 Frank Rowand      2017-10-17   91  struct overlay_changeset {
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   92  	int id;
0290c4ca2536a3 Frank Rowand      2017-10-17   93  	struct list_head ovcs_list;
1e4089667c7c73 Frank Rowand      2022-04-20   94  	const void *new_fdt;
067c098766c6af Frank Rowand      2022-04-20   95  	const void *overlay_mem;
1e4089667c7c73 Frank Rowand      2022-04-20   96  	struct device_node *overlay_root;
067c098766c6af Frank Rowand      2022-04-20   97  	enum of_overlay_notify_action notify_state;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28   98  	int count;
0290c4ca2536a3 Frank Rowand      2017-10-17   99  	struct fragment *fragments;
ccc4bf85f5a94a Pantelis Antoniou 2015-04-23  100  	const struct attribute_group **attr_groups;
3912b7917ab78d Frank Rowand      2017-10-17  101  	bool symbols_fragment;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  102  	struct of_changeset cset;
785f4b55d5d734 Pantelis Antoniou 2015-03-15  103  	struct kobject kobj;
7518b5890d8ac3 Pantelis Antoniou 2014-10-28 @104  };
7518b5890d8ac3 Pantelis Antoniou 2014-10-28  105  

:::::: The code at line 76 was first introduced by commit
:::::: 7518b5890d8ac366faa2326ce2356ef6392ce63d of/overlay: Introduce DT overlay support

:::::: TO: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
