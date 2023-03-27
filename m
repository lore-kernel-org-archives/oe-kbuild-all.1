Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488966AB6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679940744; x=1711476744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHEusEBvCSPr6xHWXxFbZlXzTLxOuJ7bKPJOuO5tBrc=;
  b=fcWRDp3BYgTEiXlQxIMmWq2itakHTp7BYI74mJzgw9sCqKHZ9UdKqCrq
   chVMGz1jWuH19NwLIuy5jWpo3/GOaXX3185NsgOGKayWmso9+4tLqNJnY
   vqYi2eu7I4BU07jtVrx2oYCADWCT1AWt0ZAzhqSicINQTRMj+Yc/3AcLV
   RTzNVo26s2E0oI8UM175t/UMfKM0FGy8CCkK1NxYWB16YnzF1X+PX1LH9
   RVM1qNnbqoiCZwkFYhNjiMzk8H1GvjLzegoyxDdKl4qZ99j1BCLq2lTvH
   B4IXqQA+rdnObG6PhlTYByvEATAHyGdejufeD2agHUg4ArBW2sDwqACsx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="342753068"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="342753068"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 11:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677072842"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="677072842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2023 11:12:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgrKP-000Hud-2h;
	Mon, 27 Mar 2023 18:12:21 +0000
Date: Tue, 28 Mar 2023 02:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-next 22/23] net/sunrpc/svcsock.c:237:22: error:
 'TLS_RECORD_TYPE_ALERT' undeclared; did you mean 'TLS_RECORD_TYPE_DATA'?
Message-ID: <202303280242.Xv5LvXcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-next
head:   1fe18960b9965f80c2d27af8f3cc769b587e7b23
commit: 5e8add4e4927986d790e0bf718269d102dc7ccf6 [22/23] SUNRPC: Recognize control messages in server-side TCP socket code
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230328/202303280242.Xv5LvXcx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=5e8add4e4927986d790e0bf718269d102dc7ccf6
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel nfsd-next
        git checkout 5e8add4e4927986d790e0bf718269d102dc7ccf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280242.Xv5LvXcx-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sunrpc/svcsock.c: In function 'svc_tcp_sock_process_cmsg':
>> net/sunrpc/svcsock.c:237:22: error: 'TLS_RECORD_TYPE_ALERT' undeclared (first use in this function); did you mean 'TLS_RECORD_TYPE_DATA'?
     237 |                 case TLS_RECORD_TYPE_ALERT:
         |                      ^~~~~~~~~~~~~~~~~~~~~
         |                      TLS_RECORD_TYPE_DATA
   net/sunrpc/svcsock.c:237:22: note: each undeclared identifier is reported only once for each function it appears in


vim +237 net/sunrpc/svcsock.c

   219	
   220	static int
   221	svc_tcp_sock_process_cmsg(struct svc_sock *svsk, struct msghdr *msg,
   222				  struct cmsghdr *cmsg, int ret)
   223	{
   224		if (cmsg->cmsg_level == SOL_TLS &&
   225		    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
   226			u8 content_type = *((u8 *)CMSG_DATA(cmsg));
   227	
   228			trace_svcsock_tls_ctype(&svsk->sk_xprt, content_type);
   229			switch (content_type) {
   230			case TLS_RECORD_TYPE_DATA:
   231				/* TLS sets EOR at the end of each application data
   232				 * record, even though there might be more frames
   233				 * waiting to be decrypted.
   234				 */
   235				msg->msg_flags &= ~MSG_EOR;
   236				break;
 > 237			case TLS_RECORD_TYPE_ALERT:
   238				ret = -ENOTCONN;
   239				break;
   240			default:
   241				ret = -EAGAIN;
   242			}
   243		}
   244		return ret;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
