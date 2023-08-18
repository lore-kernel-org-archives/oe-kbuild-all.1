Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38A1643D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692346874; x=1723882874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJX3bq2W7zYIaKD+dz0VwVyv6B5zwHTftsZowgazRF8=;
  b=JI9+zwgOUG5j+u4R2+HgNjwAfb9wPSXPYmZRGBvAJUu9GPZpPwL+c3ef
   Z3FgWd/RQnbE1qafR3O+yMH9INfwbkGJMwqo7ys7yMRulua47t7n7hWAb
   dZqTTxx9pHyiNFfiF5knGNvhKFWtU46LzjrrOEDJiReLpMYaY1gYKE/Gb
   05SZoJ69zKmBFDCp5DvoVLa2XBT4o0ZGD6+WNFwNIGmQcN3glknUHkN8y
   1djqYLlJTuSUXHhLP2KnZ3466iTF5LsIdnL37ju2GAX0dLXQdOuUUlQoe
   GQpchuiQdCAZ8VBHUBoOdflqSDRZ+iBLjO5lKVFF0CS6DVKCa968ou7Tq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="371948069"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="371948069"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 01:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981564419"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="981564419"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2023 01:21:12 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWujH-0002Ge-0j;
	Fri, 18 Aug 2023 08:21:11 +0000
Date: Fri, 18 Aug 2023 16:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishali Thakkar <vaishali.thakkar@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Wang <jinpu.wang@ionos.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 1431/9999]
 drivers/infiniband/ulp/rtrs/rtrs-clt.c:2804: warning: Function parameter or
 member 'pathname' not described in 'rtrs_clt_open'
Message-ID: <202308181648.dSM0RMIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaishali,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 527df029be346cdcc888e1e32d1dab243670fa34 [1431/9999] RDMA/rtrs-clt: Rename rtrs_clt_sess to rtrs_clt_path
config: openrisc-randconfig-r024-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181648.dSM0RMIw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181648.dSM0RMIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181648.dSM0RMIw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/ulp/rtrs/rtrs-clt.c:2804: warning: Function parameter or member 'pathname' not described in 'rtrs_clt_open'
>> drivers/infiniband/ulp/rtrs/rtrs-clt.c:2804: warning: Excess function parameter 'sessname' description in 'rtrs_clt_open'


vim +2804 drivers/infiniband/ulp/rtrs/rtrs-clt.c

6a98d71daea186 Jack Wang        2020-05-11  2779  
6a98d71daea186 Jack Wang        2020-05-11  2780  /**
527df029be346c Vaishali Thakkar 2022-01-05  2781   * rtrs_clt_open() - Open a path to an RTRS server
6a98d71daea186 Jack Wang        2020-05-11  2782   * @ops: holds the link event callback and the private pointer.
6a98d71daea186 Jack Wang        2020-05-11  2783   * @sessname: name of the session
6a98d71daea186 Jack Wang        2020-05-11  2784   * @paths: Paths to be established defined by their src and dst addresses
6a98d71daea186 Jack Wang        2020-05-11  2785   * @paths_num: Number of elements in the @paths array
6a98d71daea186 Jack Wang        2020-05-11  2786   * @port: port to be used by the RTRS session
6a98d71daea186 Jack Wang        2020-05-11  2787   * @pdu_sz: Size of extra payload which can be accessed after permit allocation.
6a98d71daea186 Jack Wang        2020-05-11  2788   * @reconnect_delay_sec: time between reconnect tries
6a98d71daea186 Jack Wang        2020-05-11  2789   * @max_reconnect_attempts: Number of times to reconnect on error before giving
6a98d71daea186 Jack Wang        2020-05-11  2790   *			    up, 0 for * disabled, -1 for forever
2958a995edc946 Gioh Kim         2021-04-19  2791   * @nr_poll_queues: number of polling mode connection using IB_POLL_DIRECT flag
6a98d71daea186 Jack Wang        2020-05-11  2792   *
6a98d71daea186 Jack Wang        2020-05-11  2793   * Starts session establishment with the rtrs_server. The function can block
6a98d71daea186 Jack Wang        2020-05-11  2794   * up to ~2000ms before it returns.
6a98d71daea186 Jack Wang        2020-05-11  2795   *
6a98d71daea186 Jack Wang        2020-05-11  2796   * Return a valid pointer on success otherwise PTR_ERR.
6a98d71daea186 Jack Wang        2020-05-11  2797   */
6a98d71daea186 Jack Wang        2020-05-11  2798  struct rtrs_clt *rtrs_clt_open(struct rtrs_clt_ops *ops,
527df029be346c Vaishali Thakkar 2022-01-05  2799  				 const char *pathname,
6a98d71daea186 Jack Wang        2020-05-11  2800  				 const struct rtrs_addr *paths,
6a98d71daea186 Jack Wang        2020-05-11  2801  				 size_t paths_num, u16 port,
6a98d71daea186 Jack Wang        2020-05-11  2802  				 size_t pdu_sz, u8 reconnect_delay_sec,
2958a995edc946 Gioh Kim         2021-04-19  2803  				 s16 max_reconnect_attempts, u32 nr_poll_queues)
6a98d71daea186 Jack Wang        2020-05-11 @2804  {
527df029be346c Vaishali Thakkar 2022-01-05  2805  	struct rtrs_clt_path *clt_path, *tmp;
6a98d71daea186 Jack Wang        2020-05-11  2806  	struct rtrs_clt *clt;
6a98d71daea186 Jack Wang        2020-05-11  2807  	int err, i;
6a98d71daea186 Jack Wang        2020-05-11  2808  
527df029be346c Vaishali Thakkar 2022-01-05  2809  	if (strchr(pathname, '/') || strchr(pathname, '.')) {
527df029be346c Vaishali Thakkar 2022-01-05  2810  		pr_err("pathname cannot contain / and .\n");
e44928f2db0f97 Md Haris Iqbal   2021-09-22  2811  		err = -EINVAL;
e44928f2db0f97 Md Haris Iqbal   2021-09-22  2812  		goto out;
e44928f2db0f97 Md Haris Iqbal   2021-09-22  2813  	}
e44928f2db0f97 Md Haris Iqbal   2021-09-22  2814  
527df029be346c Vaishali Thakkar 2022-01-05  2815  	clt = alloc_clt(pathname, paths_num, port, pdu_sz, ops->priv,
6a98d71daea186 Jack Wang        2020-05-11  2816  			ops->link_ev,
7404bddeb43902 Jack Wang        2021-06-21  2817  			reconnect_delay_sec,
6a98d71daea186 Jack Wang        2020-05-11  2818  			max_reconnect_attempts);
6a98d71daea186 Jack Wang        2020-05-11  2819  	if (IS_ERR(clt)) {
6a98d71daea186 Jack Wang        2020-05-11  2820  		err = PTR_ERR(clt);
6a98d71daea186 Jack Wang        2020-05-11  2821  		goto out;
6a98d71daea186 Jack Wang        2020-05-11  2822  	}
6a98d71daea186 Jack Wang        2020-05-11  2823  	for (i = 0; i < paths_num; i++) {
527df029be346c Vaishali Thakkar 2022-01-05  2824  		struct rtrs_clt_path *clt_path;
6a98d71daea186 Jack Wang        2020-05-11  2825  
527df029be346c Vaishali Thakkar 2022-01-05  2826  		clt_path = alloc_path(clt, &paths[i], nr_cpu_ids,
7404bddeb43902 Jack Wang        2021-06-21  2827  				  nr_poll_queues);
527df029be346c Vaishali Thakkar 2022-01-05  2828  		if (IS_ERR(clt_path)) {
527df029be346c Vaishali Thakkar 2022-01-05  2829  			err = PTR_ERR(clt_path);
527df029be346c Vaishali Thakkar 2022-01-05  2830  			goto close_all_path;
6a98d71daea186 Jack Wang        2020-05-11  2831  		}
03e9b33a0fd677 Md Haris Iqbal   2021-02-12  2832  		if (!i)
527df029be346c Vaishali Thakkar 2022-01-05  2833  			clt_path->for_new_clt = 1;
527df029be346c Vaishali Thakkar 2022-01-05  2834  		list_add_tail_rcu(&clt_path->s.entry, &clt->paths_list);
6a98d71daea186 Jack Wang        2020-05-11  2835  
527df029be346c Vaishali Thakkar 2022-01-05  2836  		err = init_path(clt_path);
6a98d71daea186 Jack Wang        2020-05-11  2837  		if (err) {
527df029be346c Vaishali Thakkar 2022-01-05  2838  			list_del_rcu(&clt_path->s.entry);
527df029be346c Vaishali Thakkar 2022-01-05  2839  			rtrs_clt_close_conns(clt_path, true);
527df029be346c Vaishali Thakkar 2022-01-05  2840  			free_percpu(clt_path->stats->pcpu_stats);
527df029be346c Vaishali Thakkar 2022-01-05  2841  			kfree(clt_path->stats);
527df029be346c Vaishali Thakkar 2022-01-05  2842  			free_path(clt_path);
527df029be346c Vaishali Thakkar 2022-01-05  2843  			goto close_all_path;
6a98d71daea186 Jack Wang        2020-05-11  2844  		}
6a98d71daea186 Jack Wang        2020-05-11  2845  
527df029be346c Vaishali Thakkar 2022-01-05  2846  		err = rtrs_clt_create_path_files(clt_path);
6a98d71daea186 Jack Wang        2020-05-11  2847  		if (err) {
527df029be346c Vaishali Thakkar 2022-01-05  2848  			list_del_rcu(&clt_path->s.entry);
527df029be346c Vaishali Thakkar 2022-01-05  2849  			rtrs_clt_close_conns(clt_path, true);
527df029be346c Vaishali Thakkar 2022-01-05  2850  			free_percpu(clt_path->stats->pcpu_stats);
527df029be346c Vaishali Thakkar 2022-01-05  2851  			kfree(clt_path->stats);
527df029be346c Vaishali Thakkar 2022-01-05  2852  			free_path(clt_path);
527df029be346c Vaishali Thakkar 2022-01-05  2853  			goto close_all_path;
6a98d71daea186 Jack Wang        2020-05-11  2854  		}
6a98d71daea186 Jack Wang        2020-05-11  2855  	}
6a98d71daea186 Jack Wang        2020-05-11  2856  	err = alloc_permits(clt);
6a98d71daea186 Jack Wang        2020-05-11  2857  	if (err)
527df029be346c Vaishali Thakkar 2022-01-05  2858  		goto close_all_path;
6a98d71daea186 Jack Wang        2020-05-11  2859  
6a98d71daea186 Jack Wang        2020-05-11  2860  	return clt;
6a98d71daea186 Jack Wang        2020-05-11  2861  
527df029be346c Vaishali Thakkar 2022-01-05  2862  close_all_path:
527df029be346c Vaishali Thakkar 2022-01-05  2863  	list_for_each_entry_safe(clt_path, tmp, &clt->paths_list, s.entry) {
527df029be346c Vaishali Thakkar 2022-01-05  2864  		rtrs_clt_destroy_path_files(clt_path, NULL);
527df029be346c Vaishali Thakkar 2022-01-05  2865  		rtrs_clt_close_conns(clt_path, true);
527df029be346c Vaishali Thakkar 2022-01-05  2866  		kobject_put(&clt_path->kobj);
6a98d71daea186 Jack Wang        2020-05-11  2867  	}
7b47b27fcb4ece Guoqing Jiang    2020-12-17  2868  	rtrs_clt_destroy_sysfs_root(clt);
6a98d71daea186 Jack Wang        2020-05-11  2869  	free_clt(clt);
6a98d71daea186 Jack Wang        2020-05-11  2870  
6a98d71daea186 Jack Wang        2020-05-11  2871  out:
6a98d71daea186 Jack Wang        2020-05-11  2872  	return ERR_PTR(err);
6a98d71daea186 Jack Wang        2020-05-11  2873  }
6a98d71daea186 Jack Wang        2020-05-11  2874  EXPORT_SYMBOL(rtrs_clt_open);
6a98d71daea186 Jack Wang        2020-05-11  2875  

:::::: The code at line 2804 was first introduced by commit
:::::: 6a98d71daea186247005099758af549e6afdd244 RDMA/rtrs: client: main functionality

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
