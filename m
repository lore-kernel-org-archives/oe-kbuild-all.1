Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C8A944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682459104; x=1713995104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QykCodoxCjYPsvFBT9BYYHLb2+QG8EOs85UQFzRc+2E=;
  b=myy0RwDmKrJrOl0q+Ofnemq8aYgalRXVd249u9Zn7lsnItEe+Oi9V1xK
   Sa5qxpJZhU3XzurdzYe6ol0I1yZrjurvz807RXCauk5eYY508RWGh5D0m
   ZhFweSHTb5zhtmKMvGu82jIpIZfUVvXEPXt5ulmEYdDL07v/mWZ+5AWBN
   PIGHkWJeHHS+6w2XCqnUp9KbpjxFHwj6CvaWQ7+egAqsbqgcxIWIhNchv
   q9FQf6m67PHrPJtSICmsqZ/hatqzC3OnE591Mj62it3lSegcvX8s1Ga1u
   2yOw2c9ABA+6LQnksbAsNDzO7nqFC46kPHSZmqQvzNJtL8WwDwHt1SUXe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344369487"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="344369487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="696368234"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="696368234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 14:45:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prQT7-000jnc-0N;
	Tue, 25 Apr 2023 21:45:01 +0000
Date: Wed, 26 Apr 2023 05:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fsfa3-next-20230425 1/1]
 kernel/bpf/net_namespace.c:437:27: warning: array subscript [0, 1] is
 outside array bounds of 'struct bpf_prog *[2]'
Message-ID: <202304260539.vm2qQLzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fsfa3-next-20230425
head:   b82a35ff486df1d6737f532e08e060c466f9e652
commit: b82a35ff486df1d6737f532e08e060c466f9e652 [1/1] Makefile: Enable -Wstringop-overflow and -Warray-bounds
config: microblaze-randconfig-r002-20230424 (https://download.01.org/0day-ci/archive/20230426/202304260539.vm2qQLzo-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=b82a35ff486df1d6737f532e08e060c466f9e652
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fsfa3-next-20230425
        git checkout b82a35ff486df1d6737f532e08e060c466f9e652
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260539.vm2qQLzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/net_namespace.c: In function 'netns_bpf_link_attach':
>> kernel/bpf/net_namespace.c:437:27: warning: array subscript [0, 1] is outside array bounds of 'struct bpf_prog *[2]' [-Warray-bounds]
     437 |         if (net->bpf.progs[type]) {
         |             ~~~~~~~~~~~~~~^~~~~~
   In file included from include/linux/bpf-netns.h:6,
                    from kernel/bpf/net_namespace.c:4:
   include/net/netns/bpf.h:24:26: note: while referencing 'progs'
      24 |         struct bpf_prog *progs[MAX_NETNS_BPF_ATTACH_TYPE];
         |                          ^~~~~


vim +437 kernel/bpf/net_namespace.c

ce3aa9cc510936 Jakub Sitnicki 2020-07-17  420  
7f045a49fee04b Jakub Sitnicki 2020-05-31  421  static int netns_bpf_link_attach(struct net *net, struct bpf_link *link,
7f045a49fee04b Jakub Sitnicki 2020-05-31  422  				 enum netns_bpf_attach_type type)
7f045a49fee04b Jakub Sitnicki 2020-05-31  423  {
ab53cad90eb10c Jakub Sitnicki 2020-06-25  424  	struct bpf_netns_link *net_link =
ab53cad90eb10c Jakub Sitnicki 2020-06-25  425  		container_of(link, struct bpf_netns_link, link);
695c12147a4018 Jakub Sitnicki 2020-06-25  426  	struct bpf_prog_array *run_array;
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  427  	int cnt, err;
7f045a49fee04b Jakub Sitnicki 2020-05-31  428  
7f045a49fee04b Jakub Sitnicki 2020-05-31  429  	mutex_lock(&netns_bpf_mutex);
7f045a49fee04b Jakub Sitnicki 2020-05-31  430  
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  431  	cnt = link_count(net, type);
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  432  	if (cnt >= netns_bpf_max_progs(type)) {
7f045a49fee04b Jakub Sitnicki 2020-05-31  433  		err = -E2BIG;
7f045a49fee04b Jakub Sitnicki 2020-05-31  434  		goto out_unlock;
7f045a49fee04b Jakub Sitnicki 2020-05-31  435  	}
7f045a49fee04b Jakub Sitnicki 2020-05-31  436  	/* Links are not compatible with attaching prog directly */
695c12147a4018 Jakub Sitnicki 2020-06-25 @437  	if (net->bpf.progs[type]) {
7f045a49fee04b Jakub Sitnicki 2020-05-31  438  		err = -EEXIST;
7f045a49fee04b Jakub Sitnicki 2020-05-31  439  		goto out_unlock;
7f045a49fee04b Jakub Sitnicki 2020-05-31  440  	}
7f045a49fee04b Jakub Sitnicki 2020-05-31  441  
7f045a49fee04b Jakub Sitnicki 2020-05-31  442  	switch (type) {
7f045a49fee04b Jakub Sitnicki 2020-05-31  443  	case NETNS_BPF_FLOW_DISSECTOR:
3b7016996c4c44 Jakub Sitnicki 2020-06-25  444  		err = flow_dissector_bpf_prog_attach_check(net, link->prog);
7f045a49fee04b Jakub Sitnicki 2020-05-31  445  		break;
e9ddbb7707ff58 Jakub Sitnicki 2020-07-17  446  	case NETNS_BPF_SK_LOOKUP:
e9ddbb7707ff58 Jakub Sitnicki 2020-07-17  447  		err = 0; /* nothing to check */
e9ddbb7707ff58 Jakub Sitnicki 2020-07-17  448  		break;
7f045a49fee04b Jakub Sitnicki 2020-05-31  449  	default:
7f045a49fee04b Jakub Sitnicki 2020-05-31  450  		err = -EINVAL;
7f045a49fee04b Jakub Sitnicki 2020-05-31  451  		break;
7f045a49fee04b Jakub Sitnicki 2020-05-31  452  	}
7f045a49fee04b Jakub Sitnicki 2020-05-31  453  	if (err)
7f045a49fee04b Jakub Sitnicki 2020-05-31  454  		goto out_unlock;
7f045a49fee04b Jakub Sitnicki 2020-05-31  455  
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  456  	run_array = bpf_prog_array_alloc(cnt + 1, GFP_KERNEL);
695c12147a4018 Jakub Sitnicki 2020-06-25  457  	if (!run_array) {
695c12147a4018 Jakub Sitnicki 2020-06-25  458  		err = -ENOMEM;
695c12147a4018 Jakub Sitnicki 2020-06-25  459  		goto out_unlock;
695c12147a4018 Jakub Sitnicki 2020-06-25  460  	}
695c12147a4018 Jakub Sitnicki 2020-06-25  461  
ab53cad90eb10c Jakub Sitnicki 2020-06-25  462  	list_add_tail(&net_link->node, &net->bpf.links[type]);
7f045a49fee04b Jakub Sitnicki 2020-05-31  463  
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  464  	fill_prog_array(net, type, run_array);
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  465  	run_array = rcu_replace_pointer(net->bpf.run_array[type], run_array,
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  466  					lockdep_is_held(&netns_bpf_mutex));
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  467  	bpf_prog_array_free(run_array);
ce3aa9cc510936 Jakub Sitnicki 2020-07-17  468  
1559b4aa1db443 Jakub Sitnicki 2020-07-17  469  	/* Mark attach point as used */
1559b4aa1db443 Jakub Sitnicki 2020-07-17  470  	netns_bpf_attach_type_need(type);
1559b4aa1db443 Jakub Sitnicki 2020-07-17  471  
7f045a49fee04b Jakub Sitnicki 2020-05-31  472  out_unlock:
7f045a49fee04b Jakub Sitnicki 2020-05-31  473  	mutex_unlock(&netns_bpf_mutex);
7f045a49fee04b Jakub Sitnicki 2020-05-31  474  	return err;
7f045a49fee04b Jakub Sitnicki 2020-05-31  475  }
7f045a49fee04b Jakub Sitnicki 2020-05-31  476  

:::::: The code at line 437 was first introduced by commit
:::::: 695c12147a40181fe9221d321c3f2de33c9574ed bpf, netns: Keep attached programs in bpf_prog_array

:::::: TO: Jakub Sitnicki <jakub@cloudflare.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
