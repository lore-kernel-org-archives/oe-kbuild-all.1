Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE7539D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681985799; x=1713521799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1wio5+GS73EYb2xEhOsdtzGBVXThwrzIdaBXBs0C2k=;
  b=gL65Wz1TEvTPERqFzyb+jamfiFofwNgNklyFDRpSL3wGeQcMXJTXFaaI
   8wtxjL+2xc/yT4rSA3FIAJ8/xLETE1d0H7J36foAY2KohDoN5gkNG7skX
   V7B4XFwnXodXSo2NGeUbKkj370kfUQ41udUpE+ACYwuibtP3qGZy8XwHs
   q2mGBvMqVEBRTP1B1BBYsmjDPXoe0FogEWDU2CO1lb0iLJk8CQiXrw6KR
   qBBGpC0O+Lstno7NP56Nx8wl4rEq3GBW38s8YKiVKNgE/v+LNG89z7uDr
   +89Jclpp/0WEOg/WKyiGjuYmHOqX45ajdrpgkOKNMSXw93m9biCeqXzTI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="326022818"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="326022818"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835675935"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="835675935"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2023 03:16:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppRLA-000fjh-30;
	Thu, 20 Apr 2023 10:16:36 +0000
Date: Thu, 20 Apr 2023 18:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] sched: drop for_each_numa_hop_mask()
Message-ID: <202304201832.dPYSOjPk-lkp@intel.com>
References: <20230420051946.7463-9-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420051946.7463-9-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on linus/master v6.3-rc7]
[cannot apply to tip/sched/core horms-ipvs/master net-next/main next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/lib-find-add-find_next_and_andnot_bit/20230420-132247
patch link:    https://lore.kernel.org/r/20230420051946.7463-9-yury.norov%40gmail.com
patch subject: [PATCH v2 8/8] sched: drop for_each_numa_hop_mask()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201832.dPYSOjPk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2425882bb68586aad08582c2efbb860a78e1b8e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yury-Norov/lib-find-add-find_next_and_andnot_bit/20230420-132247
        git checkout 2425882bb68586aad08582c2efbb860a78e1b8e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201832.dPYSOjPk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_base.c: In function 'ice_vsi_alloc_q_vectors':
   drivers/net/ethernet/intel/ice/ice_base.c:681:9: error: implicit declaration of function 'for_each_numa_hop_mask'; did you mean 'for_each_numa_cpu'? [-Werror=implicit-function-declaration]
     681 |         for_each_numa_hop_mask(aff_mask, numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_numa_cpu
   drivers/net/ethernet/intel/ice/ice_base.c:681:52: error: expected ';' before '{' token
     681 |         for_each_numa_hop_mask(aff_mask, numa_node) {
         |                                                    ^~
         |                                                    ;
>> drivers/net/ethernet/intel/ice/ice_base.c:665:20: warning: unused variable 'cpu' [-Wunused-variable]
     665 |         u16 v_idx, cpu = 0;
         |                    ^~~
>> drivers/net/ethernet/intel/ice/ice_base.c:662:31: warning: unused variable 'last_aff_mask' [-Wunused-variable]
     662 |         cpumask_t *aff_mask, *last_aff_mask = cpu_none_mask;
         |                               ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu +665 drivers/net/ethernet/intel/ice/ice_base.c

eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  652  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  653  /**
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  654   * ice_vsi_alloc_q_vectors - Allocate memory for interrupt vectors
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  655   * @vsi: the VSI being configured
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  656   *
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  657   * We allocate one q_vector per queue interrupt. If allocation fails we
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  658   * return -ENOMEM.
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  659   */
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  660  int ice_vsi_alloc_q_vectors(struct ice_vsi *vsi)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  661  {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16 @662  	cpumask_t *aff_mask, *last_aff_mask = cpu_none_mask;
3306f79f428e85 Anirudh Venkataramanan 2020-02-06  663  	struct device *dev = ice_pf_to_dev(vsi->back);
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  664  	int numa_node = dev->numa_node;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16 @665  	u16 v_idx, cpu = 0;
88865fc4bbd61e Karol Kolacinski       2020-05-07  666  	int err;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  667  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  668  	if (vsi->q_vectors[0]) {
4015d11e4b9720 Brett Creeley          2019-11-08  669  		dev_dbg(dev, "VSI %d has existing q_vectors\n", vsi->vsi_num);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  670  		return -EEXIST;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  671  	}
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  672  
3306f79f428e85 Anirudh Venkataramanan 2020-02-06  673  	for (v_idx = 0; v_idx < vsi->num_q_vectors; v_idx++) {
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  674  		err = ice_vsi_alloc_q_vector(vsi, v_idx);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  675  		if (err)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  676  			goto err_out;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  677  	}
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  678  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  679  	v_idx = 0;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  680  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  681  	for_each_numa_hop_mask(aff_mask, numa_node) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  682  		for_each_cpu_andnot(cpu, aff_mask, last_aff_mask) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  683  			if (v_idx >= vsi->num_q_vectors)
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  684  				goto out;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  685  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  686  			if (cpu_online(cpu)) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  687  				cpumask_set_cpu(cpu, &vsi->q_vectors[v_idx]->affinity_mask);
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  688  				v_idx++;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  689  			}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  690  		}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  691  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  692  		last_aff_mask = aff_mask;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  693  	}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  694  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  695  out:
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  696  	return 0;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  697  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  698  err_out:
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  699  	while (v_idx--)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  700  		ice_free_q_vector(vsi, v_idx);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  701  
4015d11e4b9720 Brett Creeley          2019-11-08  702  	dev_err(dev, "Failed to allocate %d q_vector for VSI %d, ret=%d\n",
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  703  		vsi->num_q_vectors, vsi->vsi_num, err);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  704  	vsi->num_q_vectors = 0;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  705  	return err;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  706  }
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
