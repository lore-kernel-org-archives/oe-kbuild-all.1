Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3EC952
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679415683; x=1710951683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBCGICOKuc1AfSI5Blno7H4bKyVrIqf6ilKotBsE3Bg=;
  b=e8tx1ZBKiaE8tMg0gGaEWE36JFV7BeOqPT4wpamIOQciws4xbrotqaQh
   QNBPpOTHgSi4tztkDzZraZdFLTlEvqp9OiFUkfGyJ9Ys6s3i6ejSlpZq/
   sk9otnirXofP+1G2oswZnLyJ6rV9ZW3hFSp9x0xbuo1Wt0Z5zKxJvV8qT
   1Z003TmMwQRlkvHKJxoFBdAvBxaEkpn6hum35oEOG1zvgxvs/WoTHLo9L
   GQHkI5gK/936vnq/kDNXkvoq5dd0jvDP9ZZdMUkEQvYiBbUKQbC98+xGE
   7uVCJeKc8ECu/QvdO3ZtafrcUKx6OXmw6CoYUR2X6iTS4RsvBqo9dTKzs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366722584"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="366722584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792162765"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792162765"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 09:20:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peej0-000C8d-26;
	Tue, 21 Mar 2023 16:20:38 +0000
Date: Wed, 22 Mar 2023 00:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 10/20]
 drivers/nvme/host/tcp.c:1897:9: warning: 'memset' used with length equal to
 number of elements without multiplication by element size
Message-ID: <202303220037.SJpCGBvx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 31b3d10dcf4a28f931001df8b4e539716bcbd5d3 [10/20] nvme-tcp: enable TLS handshake upcall
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303220037.SJpCGBvx-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220037.SJpCGBvx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_alloc_admin_queue':
>> drivers/nvme/host/tcp.c:1897:9: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
    1897 |         memset(keylist, 0, sizeof(key_serial_t));
         |         ^~~~~~
   drivers/nvme/host/tcp.c: In function '__nvme_tcp_alloc_io_queues':
   drivers/nvme/host/tcp.c:1927:9: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
    1927 |         memset(keylist, 0, sizeof(key_serial_t));
         |         ^~~~~~


vim +/memset +1897 drivers/nvme/host/tcp.c

  1891	
  1892	static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
  1893	{
  1894		int ret = -EINVAL, num_keys, k;
  1895		key_serial_t keylist[4];
  1896	
> 1897		memset(keylist, 0, sizeof(key_serial_t));
  1898		num_keys = nvme_tcp_lookup_psks(ctrl, keylist, 4);
  1899		for (k = 0; k < num_keys; k++) {
  1900			ret = nvme_tcp_alloc_queue(ctrl, 0, keylist[k]);
  1901			if (!ret)
  1902				break;
  1903		}
  1904		if (ret) {
  1905			/* Try without TLS */
  1906			ret = nvme_tcp_alloc_queue(ctrl, 0, 0);
  1907			if (ret)
  1908				goto out_free_queue;
  1909		}
  1910	
  1911		ret = nvme_tcp_alloc_async_req(to_tcp_ctrl(ctrl));
  1912		if (ret)
  1913			goto out_free_queue;
  1914	
  1915		return 0;
  1916	
  1917	out_free_queue:
  1918		nvme_tcp_free_queue(ctrl, 0);
  1919		return ret;
  1920	}
  1921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
