Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5361C6AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695828202; x=1727364202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBe+IEstx9SfHN4s1OjFFd+rrbGIHiUqxQypUqRPgOM=;
  b=PFf+hOnx1Sj4PMIZo4WVHh2DiFHsCZeE9Gjc0TZs93mtV8T2U53hsRb0
   PjQmjrWspT8Tr3+kpngqNOX+ybav0N0PUca1tURMLf6huntgDf+G+Kdnu
   GgWQz6ONh4F+gAoGJgEoBNY4jtxULmuI4/D4tz26zfos8sxD37nIwZbKF
   ts3XLyDFSKFsaEADRPvXtdJbkJKWEpAhyIoegSNskQDyFAAMmFVsZwcD4
   DBZS4purSg7aH+npi44A4J09hoZTFfzCKmhO+WiuJdrdVGR24P7Xi27Zx
   /HFwTdaWk3QH12BzNZ6Nbz+qpqgWbOr3flg3Djlvz9udctQUFDO8iKrZh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412761467"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="412761467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 08:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996182294"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="996182294"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 08:23:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlWNi-0000ML-0f;
	Wed, 27 Sep 2023 15:23:18 +0000
Date: Wed, 27 Sep 2023 23:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/7] net: openvswitch: Reduce stack usage in
 ovs_dp_process_packet
Message-ID: <202309272345.yNWcLYj9-lkp@intel.com>
References: <20230927001308.749910-8-npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927001308.749910-8-npiggin@gmail.com>

Hi Nicholas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on linus/master v6.6-rc3]
[cannot apply to net-next/main horms-ipvs/master next-20230927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/net-openvswitch-Move-NSH-buffer-out-of-do_execute_actions/20230927-082125
base:   net/main
patch link:    https://lore.kernel.org/r/20230927001308.749910-8-npiggin%40gmail.com
patch subject: [RFC PATCH 7/7] net: openvswitch: Reduce stack usage in ovs_dp_process_packet
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309272345.yNWcLYj9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309272345.yNWcLYj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309272345.yNWcLYj9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/openvswitch/datapath.c:246:6: warning: 'do_packet_upcall' defined but not used [-Wunused-function]
     246 | void do_packet_upcall(struct sk_buff *skb, struct sw_flow_key *key,
         |      ^~~~~~~~~~~~~~~~


vim +/do_packet_upcall +246 net/openvswitch/datapath.c

   244	
   245	static noinline_for_stack
 > 246	void do_packet_upcall(struct sk_buff *skb, struct sw_flow_key *key,
   247			      const struct vport *p, struct datapath *dp)
   248	{
   249		struct dp_upcall_info upcall;
   250		int error;
   251	
   252		memset(&upcall, 0, sizeof(upcall));
   253		upcall.cmd = OVS_PACKET_CMD_MISS;
   254	
   255		if (dp->user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU)
   256			upcall.portid =
   257			    ovs_dp_get_upcall_portid(dp, smp_processor_id());
   258		else
   259			upcall.portid = ovs_vport_find_upcall_portid(p, skb);
   260	
   261		upcall.mru = OVS_CB(skb)->mru;
   262		error = ovs_dp_upcall(dp, skb, key, &upcall, 0);
   263		switch (error) {
   264		case 0:
   265		case -EAGAIN:
   266		case -ERESTARTSYS:
   267		case -EINTR:
   268			consume_skb(skb);
   269			break;
   270		default:
   271			kfree_skb(skb);
   272			break;
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
