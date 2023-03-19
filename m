Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C633FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679269646; x=1710805646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2F9KH1lsgGYqVdhd6lttOHYqyoJpmmQKOkDRpMAvjU=;
  b=ZUJDXTqyccCpes8SvNr7f1Ax9Ksmogadt3DGGQugiYEq5K3Fuca6WV3a
   aEd36p1QZmRjwojoGlk/9DOoyN2TeQjNtg/nQr+RmX7d1yQ1+nxYtyV9x
   Erpx+lg9xreys8Skg5xWErZe00sB8yLKh9IhLZt+tsDnoyzwUri0XvJOM
   jYKsRR+vxnv54O2LgXVr/pdmBXJaL6MYzk68Wm3IavLh8Cy3H7EngHK6/
   c66G5QXclkkJLLjc8aiEtfVbzsWe2PSR0VnQ/iMKmxTYVXegYTjiHkmZd
   CJayXtfn9CgrDx66jlKGXQSc50fM8+zB0nY/cFdpFpxIpDDKlj0R1K1aZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318945835"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="318945835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 16:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="749882239"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="749882239"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2023 16:47:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe2kF-000Ai6-2b;
	Sun, 19 Mar 2023 23:47:23 +0000
Date: Mon, 20 Mar 2023 07:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:sk_data_ready 3/5] fs/dlm/lowcomms.c:1816:33: error:
 assignment to 'int (*)(struct sock *)' from incompatible pointer type 'void
 (*)(struct sock *)'
Message-ID: <202303200758.R0hOPRvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git sk_data_ready
head:   e93cfc7768b977702ee0f268969137059fa953aa
commit: 07dd10dd3d03f34e88f3c5ecf0347009ad04eb85 [3/5] net: make sk->sk_data_ready() return int
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230320/202303200758.R0hOPRvn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/congwang/linux/commit/07dd10dd3d03f34e88f3c5ecf0347009ad04eb85
        git remote add congwang https://github.com/congwang/linux.git
        git fetch --no-tags congwang sk_data_ready
        git checkout 07dd10dd3d03f34e88f3c5ecf0347009ad04eb85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/dlm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200758.R0hOPRvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dlm/lowcomms.c: In function 'dlm_listen_for_all':
>> fs/dlm/lowcomms.c:1816:33: error: assignment to 'int (*)(struct sock *)' from incompatible pointer type 'void (*)(struct sock *)' [-Werror=incompatible-pointer-types]
    1816 |         sock->sk->sk_data_ready = lowcomms_listen_data_ready;
         |                                 ^
   cc1: some warnings being treated as errors


vim +1816 fs/dlm/lowcomms.c

fdda387f73947e fs/dlm/lowcomms-tcp.c Patrick Caulfield   2006-11-02  1779  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1780  static int dlm_listen_for_all(void)
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1781  {
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1782  	struct socket *sock;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1783  	int result;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1784  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1785  	log_print("Using %s for communications",
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1786  		  dlm_proto_ops->name);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1787  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1788  	result = dlm_proto_ops->listen_validate();
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1789  	if (result < 0)
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1790  		return result;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1791  
c51c9cd8addcfb fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1792  	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1793  				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1794  	if (result < 0) {
fe93367541bced fs/dlm/lowcomms.c     Alexander Aring     2021-11-02  1795  		log_print("Can't create comms socket: %d", result);
1f4f10845e1469 fs/dlm/lowcomms.c     Dan Carpenter       2022-04-04  1796  		return result;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1797  	}
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1798  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1799  	sock_set_mark(sock->sk, dlm_config.ci_mark);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1800  	dlm_proto_ops->listen_sockopts(sock);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1801  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1802  	result = dlm_proto_ops->listen_bind(sock);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1803  	if (result < 0)
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1804  		goto out;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1805  
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1806  	lock_sock(sock->sk);
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1807  	listen_sock.sk_data_ready = sock->sk->sk_data_ready;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1808  	listen_sock.sk_write_space = sock->sk->sk_write_space;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1809  	listen_sock.sk_error_report = sock->sk->sk_error_report;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1810  	listen_sock.sk_state_change = sock->sk->sk_state_change;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1811  
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1812  	listen_con.sock = sock;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1813  
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1814  	sock->sk->sk_allocation = GFP_NOFS;
98123866fcf3fe fs/dlm/lowcomms.c     Benjamin Coddington 2022-12-16  1815  	sock->sk->sk_use_task_frag = false;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17 @1816  	sock->sk->sk_data_ready = lowcomms_listen_data_ready;
c3d88dfd15835f fs/dlm/lowcomms.c     Alexander Aring     2022-11-17  1817  	release_sock(sock->sk);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1818  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1819  	result = sock->ops->listen(sock, 5);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1820  	if (result < 0) {
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1821  		dlm_close_sock(&listen_con.sock);
08ae0547e75ec3 fs/dlm/lowcomms.c     Alexander Aring     2022-10-27  1822  		return result;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1823  	}
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1824  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1825  	return 0;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1826  
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1827  out:
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1828  	sock_release(sock);
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1829  	return result;
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1830  }
2dc6b1158c28c3 fs/dlm/lowcomms.c     Alexander Aring     2021-07-16  1831  

:::::: The code at line 1816 was first introduced by commit
:::::: c3d88dfd15835f42c79467eee2c40db3095e5271 fs: dlm: cleanup listen sock handling

:::::: TO: Alexander Aring <aahringo@redhat.com>
:::::: CC: David Teigland <teigland@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
